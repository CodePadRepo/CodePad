const editorElem = document.body.querySelector("#editor");
editorElem.addEventListener('input', (event) => {
    console.log("Text changed");
    window.webkit.messageHandlers.editorMessageHandler.postMessage({
        event: "text_change",
        data: [editorElem.innerText]
    });
});
