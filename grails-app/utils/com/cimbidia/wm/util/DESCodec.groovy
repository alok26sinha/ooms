/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.wm.util

import java.security.*;
import javax.crypto.*;
import javax.crypto.spec.*;

class DESCodec {
	
	static encode = { String target ->
		def cipher = getCipher(Cipher.ENCRYPT_MODE)
		return cipher.doFinal(target.bytes).encodeBase64()
	}
	
	static decode = { String target ->
		def cipher = getCipher(Cipher.DECRYPT_MODE)
		return new String(cipher.doFinal(target.decodeBase64()))
	}
	
	private static getCipher(mode) {
		def keySpec = new DESKeySpec(getPassphrase())
		def cipher = Cipher.getInstance("DES")
		def keyFactory = SecretKeyFactory.getInstance("DES")
		cipher.init(mode, keyFactory.generateSecret(keySpec))
		return cipher
	}
	
	/**
	 * The DES key used to create the cipher.  This is not the same as the password
	 * that we want to encrypt/decrypt.  That's specified in the call argument(s).
	 * 
	 * TODO This should be pulled from a properties file to make this more secure. 
	 * @return
	 */
	private static getPassphrase() { 
		"secret12".getBytes("UTF-8")
	}
	
	static void main(args) {
		if(args) {
			println encode(args[0])
		}
	}
}