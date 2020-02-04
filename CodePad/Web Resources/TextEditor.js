modelist = ace.require("ace/ext/modelist");

initializeEditor = (theme, filename) => {
    editor = ace.edit("editor");
    editor.setTheme(`ace/theme/${theme}`);
    const mode = modelist.getModeForPath(filename).mode
    editor.session.setMode(mode);
    
    window.webkit.messageHandlers.editorMessageHandler.postMessage({
        event: "editor_ready",
        data: []
    });
}

window.webkit.messageHandlers.editorMessageHandler.postMessage({
    event: "request_init",
    data: []
});
