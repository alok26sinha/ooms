/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.wm.data

import groovy.sql.Sql

import org.apache.commons.lang.StringEscapeUtils
import org.grails.plugins.csv.CSVWriter
import org.grails.plugins.excelimport.ExcelImportUtils
import com.cimbidia.wm.core.Constants
import com.cimbidia.wm.core.UnitOfMeasureType
import com.cimbidia.wm.importer.ImportDataCommand
import com.cimbidia.wm.importer.InventoryLevelExcelImporter

import com.cimbidia.wm.product.Product
import com.cimbidia.wm.product.Category
import com.cimbidia.wm.product.ProductPackage

import java.text.SimpleDateFormat

import org.apache.poi.ss.usermodel.*
import org.apache.poi.hssf.usermodel.*
import org.apache.poi.hssf.usermodel.*

import com.cimbidia.wm.core.Tag;
import com.cimbidia.wm.core.UnitOfMeasure;
import com.cimbidia.wm.core.UnitOfMeasureClass;

import static com.cimbidia.wm.core.UnitOfMeasureType.AREA

class DataService {

    def productService

	static transactional = true

    /**
     * Validate inventory levels
     */
    /*def validateInventoryLevels(ImportDataCommand command) {
        println "validate inventory levels " + command.filename
        validateInventoryLevels(command.location, command.filename)
    }*/

    /**
     *
     * @param location
     * @param fileName
     * @return
     */
    /*def validateInventoryLevels(location, fileName) {
        InventoryLevelExcelImporter importer = new InventoryLevelExcelImporter(fileName);
        def inventoryLevelList = importer.getData();
        inventoryLevelList.each { row ->
            if (!validateInventoryLevel(row)) {
                return false
            }
        }
        return true
    }

    def validateInventoryLevel(row) {
        row.each { k, v ->
            def expectedType = InventoryLevelExcelImporter.propertyMap.get(k).expectedType
            switch (expectedType) {
                case  ExcelImportUtils.PROPERTY_TYPE_STRING:
                    assert !v || v instanceof String
                    break;

                case ExcelImportUtils.PROPERTY_TYPE_DATE:
                    assert !v || v instanceof Date
                    break;

                case ExcelImportUtils.PROPERTY_TYPE_INT:
                    assert !v || v instanceof Number
                    break;

                default:
                    break;
            }
        }
        return true
    }

    def importInventoryLevels(ImportDataCommand command) {
        println "Import inventory levels " + command.filename
        importInventoryLevels(command.location, command.filename)
    }


    *//**
     * Import all inventory levels found in the file with the given fileName
     *
     * @param location
     * @param fileName
     * @return
     *//*
    def importInventoryLevels(location, filename) {
        println "Import inventory levels " + location + " filename " + filename
        InventoryLevelExcelImporter importer = new InventoryLevelExcelImporter(filename);
        def inventoryLevelList = importer.getData();
        inventoryLevelList.each { row ->
            if (validateInventoryLevel(row)) {
                importInventoryLevel(location, row)
            }
        }
        return inventoryLevelList
    }


    *//**
     * Import a single row from the XLS file
     *
     * @param location
     * @param fileName
     * @return
     *//*
    def importInventoryLevel(location, row) {
        println "Import inventory levels " + location + " row " + row
        def product = findOrCreateProduct(row)

        // Modify product attributes (name, manufacturer, manufacturerCode, vendor, vendorCode, unitOfMeasure, etc)
        updateProduct(product, row)

        // Add tags that don't currently exist
        addTagsToProduct(product, row.tags)

        // Create inventory level for current location, include bin location
        if (location.inventory) {
            addInventoryLevelToProduct(product, location.inventory, row.binLocation, row.minQuantity, row.reorderQuantity, row.maxQuantity)
        }

        // Create product package if UOM and quantity are provided
        if (row.packageUom && row.packageSize) {
            addProductPackageToProduct(product, row.packageUom, row.packageSize, row.pricePerPackage)
        }
        // Save product
        product.save(failOnError:true)
    }

    *//**
     * Add inventory level to product
     *
     * @param product
     * @param inventory
     * @param binLocation
     * @param minQuantity
     * @param reorderQuantity
     * @param maxQuantity
     * @return
     *//*
    def addInventoryLevelToProduct(product, inventory, binLocation, minQuantity, reorderQuantity, maxQuantity) {
        findOrCreateInventoryLevel(product, inventory, binLocation, minQuantity, reorderQuantity, maxQuantity)
    }*/

    /**
     * Add product package to product
     *
     * @param product
     * @param uomCode
     * @param quantity
     * @param price
     * @return
     */
    def addProductPackageToProduct(product, uomCode, quantity, price) {
        println "Add product package to product: " + uomCode + " " + quantity + " " + price
        if (uomCode) {
            def productPackage = findOrCreateProductPackage(product, uomCode, quantity, price)
            product.addToPackages(productPackage)
            product.save(flush: true, failOnError: true)
        }
    }

    /**
     * Find or create a unit of measure with the given parameters.
     *
     * @param uomCode
     * @return
     */
    def findOrCreateUnitOfMeasure(uomCode) {
        def unitOfMeasure = UnitOfMeasure.findByCode(uomCode)
        if (!unitOfMeasure) {
            unitOfMeasure = new UnitOfMeasure()
            unitOfMeasure.uomClass = findOrCreateQuantityUnitOfMeasureClass()
            unitOfMeasure.code = uomCode
            unitOfMeasure.name = uomCode
            unitOfMeasure.description = uomCode
            unitOfMeasure.save(failOnError: true, flush: true)
        }
        return unitOfMeasure

    }

    /**
     * Find or create a unit of measure class -- we only care about Quantity.
     *
     * @return
     */
    def findOrCreateQuantityUnitOfMeasureClass() {
        def unitOfMeasureClass = UnitOfMeasureClass.findByType(UnitOfMeasureType.QUANTITY)
        if (!unitOfMeasureClass) {
            unitOfMeasureClass = new UnitOfMeasureClass()
            unitOfMeasureClass.code = "QTY"
            unitOfMeasureClass.name = "Quantity"
            unitOfMeasureClass.description = "Quantity"
            unitOfMeasureClass.active = true
            unitOfMeasureClass.type = UnitOfMeasureType.QUANTITY
            unitOfMeasureClass.save(failOnError: true, flush: true)
        }
        return unitOfMeasureClass
    }

    /**
     * Find or create an inventory level with the given parameters.
     *
     * @param product
     * @param inventory
     * @param binLocation
     * @param minQuantity
     * @param reorderQuantity
     * @param maxQuantity
     * @return
     */
   /* def findOrCreateInventoryLevel(product, inventory, binLocation, minQuantity, reorderQuantity, maxQuantity) {
        def inventoryLevel = InventoryLevel.findByProductAndInventory(product, inventory)
        if (!inventoryLevel) {
            inventoryLevel = new InventoryLevel();
        }
        inventoryLevel.status = InventoryStatus.SUPPORTED
        inventoryLevel.product = product
        inventoryLevel.binLocation = binLocation
        inventoryLevel.minQuantity = minQuantity
        inventoryLevel.reorderQuantity = reorderQuantity
        inventoryLevel.maxQuantity = maxQuantity
        //inventoryLevel.save(failOnError: true, flush: true)
        inventory.addToConfiguredProducts(inventoryLevel)
        inventory.save(flush: true, failOnError: true)
        return inventoryLevel
    }*/

    /**
     * Find or create a product package with the given parameters.
     *
     * @param product
     * @param uomCode
     * @param quantity
     * @param price
     * @return
     */
    def findOrCreateProductPackage(product, uomCode, quantity, price) {
        def unitOfMeasure = findOrCreateUnitOfMeasure(uomCode)
        def criteria = ProductPackage.createCriteria()
        def productPackage = criteria.get {
            eq('uom', unitOfMeasure)
            eq('product', product)
            eq('quantity', quantity)
        }

        if (!productPackage) {
            productPackage = new ProductPackage()
        }
        productPackage.name = unitOfMeasure.code + "/" + quantity
        productPackage.description = unitOfMeasure.code + "/" + quantity
        productPackage.product = product
        productPackage.gtin = ""
        productPackage.uom = unitOfMeasure
        productPackage.price = price?:0.0
        productPackage.quantity = quantity?:1
        productPackage.save(failOnError: true, flush: true)
        return productPackage
    }

    /**
     * Find or create a product with the given parameters.
     *
     * @param product
     * @param uomCode
     * @param quantity
     * @param price
     * @return
     */
    def findOrCreateProduct(row) {
        def category = findOrCreateCategory(row.category)
        def product = Product.findByProductCode(row.productCode)
        if (!product) {
            println("Could not find product with product code " + row.productCode)
            product = new Product()
            product.category = category
            product.productCode = row.productCode
            product.name = row.productName
            product.manufacturer = row.manufacturer
            product.manufacturerCode = row.manufacturerCode
            product.vendor = row.vendor
            product.vendorCode = row.vendorCode
            product.unitOfMeasure = row.unitOfMeasure
            product.save(flush: true, failOnError: true)
        }
        return product
    }


    /**
     * Find or create a category with the given categoryName.
     *
     * @param product
     * @param uomCode
     * @param quantity
     * @param price
     * @return
     */
    def findOrCreateCategory(categoryName) {
        def category = Category.findByName(categoryName)
        if (!category) {
            println("Could not find category " + categoryName)
            category = new Category(name: categoryName, rootCategory: Category.getRootCategory())
            category.save(failOnError: true, flush: true)
        }
        return category
    }


    /**
     * Update an existing product with the data in the given row.
     *
     * @param product
     * @param uomCode
     * @param quantity
     * @param price
     * @return
     */
    def updateProduct(product, row) {
        // Change category
        def category = productService.findOrCreateCategory(row.category)
        if (product.category != category && category) {
            product.category = category
        }

        // Change product name
        if (row.productName != product.name && product.name != null) {
            product.name = row.productName
        }

        // Change all other attributes if they exist
        if (row.manufacturer) {
            product.manufacturer = row.manufacturer
        }
        if (row.manufacturerCode) {
            product.manufacturerCode = row.manufacturerCode
        }
        if (row.vendor){
            product.vendor = row.vendor
        }
        if (row.vendorCode){
            product.vendorCode = row.vendorCode
        }
        if (row.unitOfMeasure) {
            product.unitOfMeasure = row.unitOfMeasure
        }
        if (row.pricePerUnit) {
            product.pricePerUnit = getFloat(row.pricePerUnit)
        }
    }

    /**
     * Should use the apache library to handle this.
     * @param str
     * @return
     */
    def getFloat(str) {
        try {
            return str.toFloat()
        } catch (NumberFormatException e) {
            log.error("Error converting string ${str} to float.")

            throw e;
        }
        return 0.0
    }

    /**
     * FIXME This should be a method on product.
     *
     * @param product
     * @param categoryName
     * @return
     */
    def changeCategory(product, categoryName) {
        def category = productService.findOrCreateCategory(categoryName)
        if (product.category != category && category) {
            product.category = category
        }
    }

    /**
     * FIXME This should be a method on product.
     *
     * @param product
     * @param tags
     * @return
     */
    def addTagsToProduct(product, tags) {
        productService.addTagsToProduct(product, tags.split(","))
    }

    /**
     * Testing CSV data import functionality using Sql
     *
     * @return
     */
	def importData() { 
		def sql = Sql.newInstance("jdbc:mysql://localhost:3306/mydb", "user", "pswd", "com.mysql.jdbc.Driver")
		def people = sql.dataSet("PERSON")
		new File("users.csv").splitEachLine(",") {fields ->
			people.add(
				first_name: fields[0],
				last_name: fields[1],
				email: fields[2]
			)
		}
	}

    /**
     * Export data to CSV using groovy Sql classes.
     */
	def exportData() { 
		def sql = Sql.newInstance("jdbc:mysql://localhost:3306/mydb", "user", "pswd", "com.mysql.jdbc.Driver")
		def people = sql.dataSet("PERSON")
		
		people.each { 
			log.info it;
		}
	}

    /**
     * Export the given products to CSV
     *
     * @param products
     * @return
     */
    String exportProducts(products) {
        def formatDate = new SimpleDateFormat("dd/MMM/yyyy hh:mm:ss")
        def sw = new StringWriter()

        def csvWriter = new CSVWriter(sw, {
            "ID" { it.id }
            "SKU" { it.productCode }
            "Name" { it.name }
            com.cimbidia.wm.product.Category { it.category }
            "Description" { it.description }
            "Unit of Measure" { it.unitOfMeasure }
            "Manufacturer" { it.manufacturer }
            "Brand" { it.brandName }
            "Manufacturer Code" { it.manufacturerCode }
            "Manufacturer Name" { it.manufacturerName }
            "Vendor" { it.vendor }
            "Vendor Code" { it.vendorCode }
            "Vendor Name" { it.vendorName }
            "Cold Chain" { it.coldChain }
            "UPC" { it.upc }
            "NDC" { it.ndc }
            "Date Created" { it.dateCreated }
            "Date Updated" { it.lastUpdated }
        })

        products.each { product ->
            def row =  [
                    id: product?.id,
                    productCode: product.productCode?:'',
                    name: product.name,
                    category: product?.category?.name,
                    description: product?.description?:'',
                    unitOfMeasure: product.unitOfMeasure?:'',
                    manufacturer: product.manufacturer?:'',
                    brandName: product.brandName?:'',
                    manufacturerCode: product.manufacturerCode?:'',
                    manufacturerName: product.manufacturerName?:'',
                    vendor: product.vendor?:'',
                    vendorCode: product.vendorCode?:'',
                    vendorName: product.vendorName?:'',
                    coldChain: product.coldChain?:Boolean.FALSE,
                    upc: product.upc?:'',
                    ndc: product.ndc?:'',
                    dateCreated: product.dateCreated?"${formatDate.format(product.dateCreated)}":"",
                    lastUpdated: product.lastUpdated?"${formatDate.format(product.lastUpdated)}":"",
            ]
            // We just want to make sure that these match because we use the same format to
            // FIXME It would be better if we could drive the export off of this array of columns,
            // but I'm not sure how.  It's possible that the constant could be a map of column
            // names to closures (that might work)
            assert row.keySet().size() == Constants.EXPORT_PRODUCT_COLUMNS.size()
            csvWriter << row
        }
        return sw.toString()
    }

    /**
     * Export the given requisitions to CSV.
     *
     * @param requisitions
     * @return
     */
    /*String exportRequisitions(requisitions) {
        def formatDate = new SimpleDateFormat("dd/MMM/yyyy hh:mm:ss")
        def sw = new StringWriter()

        def csvWriter = new CSVWriter(sw, {
            "ID" { it.id }
            "Requisition Number" { it.requisitionNumber }
            "Status" { it.status }
            "Type" { it.type }
            "Class" { it.commodityClass }
            "Name" { it.name }
            "Requesting ward" { it.origin }
            "Processing depot" { it.destination }

            "Requested by" { it?.requestedBy?.name }
            "Date Requested" { it.dateRequested }

            "Verified" { it?.verifiedBy?.name }
            "Date Verified" { it.dateVerified }

            "Picked" { it?.pickedBy?.name }
            "Date Picked" { it.datePicked }

            "Checked" { it?.checkedBy?.name }
            "Date Checked" { it.dateChecked }

            "Issued" { it?.issuedBy?.name }
            "Date Issued" { it.dateIssued }

            "Created" { it?.createdBy?.name }
            "Date Created" { it.dateCreated }

            "Updated" { it?.updatedBy?.name }
            "Date Updated" { it.lastUpdated }
        })

        requisitions.each { requisition ->
            def row =  [
                    id: requisition?.id,
                    requisitionNumber: requisition.requestNumber,
                    type: requisition?.type,
                    commodityClass: requisition?.commodityClass,
                    status: requisition.status,
                    name: requisition.name,
                    origin: requisition.origin,
                    destination: requisition.destination,

                    requestedBy: requisition.requestedBy,
                    dateRequested: requisition.dateRequested,

                    reviewedBy: requisition.reviewedBy,
                    dateReviewed: requisition.dateReviewed,

                    verifiedBy: requisition.verifiedBy,
                    dateVerified: requisition.dateVerified,

                    checkedBy: requisition.checkedBy,
                    dateChecked: requisition.dateChecked,

                    deliveredBy: requisition.deliveredBy,
                    dateDelivered: requisition.dateDelivered,

                    pickedBy: requisition?.picklist?.picker,
                    datePicked: requisition?.picklist?.datePicked,

                    issuedBy: requisition.issuedBy,
                    dateIssued: requisition.dateIssued,

                    receivedBy: requisition.receivedBy,
                    dateReceived: requisition.dateReceived,

                    createdBy: requisition.createdBy,
                    dateCreated: requisition.dateCreated?"${formatDate.format(requisition.dateCreated)}":"",

                    updatedBy: requisition.updatedBy,
                    lastUpdated: requisition.lastUpdated?"${formatDate.format(requisition.lastUpdated)}":"",
            ]
            csvWriter << row
        }
        return sw.toString()
    }*/

    /**
     * Generic method to generate CSV string based on given csvrows map.
     * @param csvrows
     * @return
     */
    String generateCsv(csvrows) {
        def sw = new StringWriter()
        if (csvrows) {
            def columnHeaders = csvrows[0].keySet().collect { value -> StringEscapeUtils.escapeCsv(value) }
            sw.append(columnHeaders.join(",")).append("\n")
            csvrows.each { row ->
                def values = row.values().collect { value ->
                    if (value?.toString()?.isNumber()) {
                        value
                    }
                    else {
                        //'"' + value.toString().replace('"','""') + '"'
                        StringEscapeUtils.escapeCsv(value.toString())
                    }
                }
                sw.append(values.join(","))
                sw.append("\n")
            }
        }
        return sw.toString()
    }

    /**
     * Utility method to retrieve basic properties for an upload file.
     *
     * @param uploadFile
     * @return
     */
    def getFileProperties(uploadFile) {
        def fileProps = [:]
        println "content type:        " + uploadFile.contentType
        switch(uploadFile.contentType) {
            case "text/csv":
                fileProps.type = "csv"
                break
            case "application/vnd.ms-excel":
                fileProps.type = "xls"
                break
            case "application/vnd.oasis.opendocument.spreadsheet":
                fileProps.type = "ods"
                break
            case "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet":
                fileProps.type = "xlsx"
                break
            default:
                fileProps.type = ""
        }
        fileProps.size = uploadFile.size
        return fileProps
    }

    /**
     * Converts an XLS file to a hash map.
     *
     * @param inputStream
     * @param columTypes
     * @param ignoredRows
     * @return
     */
    def xlsToSimpleHash(inputStream, columTypes, ignoredRows) {
        Workbook wb = new HSSFWorkbook(inputStream)
        //so this is just going to get sheet 1 .. who uses more than 1?
        //def numOfSheets = wb.getNumberOfSheets()
        Sheet sheet = wb.getSheetAt(0)
        def xlsData = [:]
        sheet.iterator().eachWithIndex{row, rowNum ->
            if(!ignoredRows.contains(rowNum)) {
                xlsData[rowNum] = [:]
                row.iterator().eachWithIndex{col, colNum ->
                    switch ( columTypes[colNum] ) {
                    //case ["number","num","int","integer",0, 'inList']
                        case "number":
                            xlsData[rowNum][colNum] = col.getNumericCellValue()
                            break
                        case "string":
                            xlsData[rowNum][colNum] = col.getStringCellValue()
                            break
                        case "date":
                            xlsData[rowNum][colNum] = col.getDateCellValue()
                            break
                        default:
                            xlsData[rowNum][colNum] = ''
                    }
                    //log.debug xlsData[rowNum][colNum] + " - class: "xlsData[rowNum][colNum].class
                }
            }
            else log.debug "ignoring row ${rowNum}"
        }
        return xlsData
    }

    /**
     * Saves an uploaded file to disk.
     *
     * @param uploadFile
     * @return
     */
    def saveFileToDisk(uploadFile) {
        def localFile
        try {
            localFile = new File("uploads/" + uploadFile?.originalFilename);
            localFile.mkdirs()
            uploadFile?.transferTo(localFile);
        } catch (IOException e ) {
            log.error("Error saving uploaded file: " + e.message, e)
            throw e;
        }
        return localFile
    }

}