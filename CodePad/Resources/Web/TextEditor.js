modelist = ace.require("ace/ext/modelist");

initializeEditor = (theme, filename, editorContent) => {
    editor = ace.edit("editor");
    editor.setTheme(`ace/theme/${theme}`);
    const mode = modelist.getModeForPath(filename).mode
    editor.session.setMode(mode);
    editor.setValue(editorContent)
    editor.getSession().setUndoManager(new ace.UndoManager())
    editor.clearSelection();
    
    editor.session.on("change", () => {
        console.log("Text changed");
        window.webkit.messageHandlers.editorMessageHandler.postMessage({
            event: "text_change",
            data: [editor.getValue()]
        });
    });
};

window.webkit.messageHandlers.editorMessageHandler.postMessage({
    event: "editor_ready",
    data: []
});