initializeEditor = (theme, mode) => {
    editor = ace.edit("editor");
    editor.setTheme(`ace/theme/${theme}`);
    editor.session.setMode(`ace/mode/${mode}`);
    
    window.webkit.messageHandlers.editorMessageHandler.postMessage({
        event: "editor_ready",
        data: []
    });
}

window.webkit.messageHandlers.editorMessageHandler.postMessage({
    event: "request_init",
    data: []
});
