<g:each in="${messages}" var="message">
    <div>
        <span class="nickname">${message.sender}</span> - <span class="msg">${message.message}</span>
    </div>
</g:each>