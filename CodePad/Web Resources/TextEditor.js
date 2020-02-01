editor = ace.edit("editor");
editor.setTheme("ace/theme/gruvbox");
editor.session.setMode("ace/mode/python");

window.webkit.messageHandlers.editorMessageHandler.postMessage({
    event: "editor_ready",
    data: []
});
