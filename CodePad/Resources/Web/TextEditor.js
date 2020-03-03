modelist = ace.require("ace/ext/modelist");

initializeEditor = (theme, filename, editorContent, indentSize, indentType) => {
    editor = ace.edit("editor");
    editor.setTheme(`ace/theme/${theme}`);
    const mode = modelist.getModeForPath(filename).mode
    editor.session.setOptions({
        tabSize: indentSize,
        showInvisibles: true,
        useSoftTabs: Boolean(indentType)
    });
    editor.session.setMode(mode);
    editor.setValue(editorContent)
    editor.getSession().setUndoManager(new ace.UndoManager())
    editor.clearSelection();
    
    editor.commands.removeCommand(editor.commands.byName.showSettingsMenu)
    editor.commands.addCommand({
        name: "configureCodePad",
        description: "Configure CodePad",
        exec: (editor) => {
            window.webkit.messageHandlers.editorMessageHandler.postMessage({
                event: "configure",
                data: {}
            });
        }
    });
    
    editor.session.on("change", () => {
        console.log("Text changed");
        window.webkit.messageHandlers.editorMessageHandler.postMessage({
            event: "text_change",
            data: { fileContent: editor.getValue() }
        });
    });
};

window.webkit.messageHandlers.editorMessageHandler.postMessage({
    event: "editor_ready",
    data: {}
});
