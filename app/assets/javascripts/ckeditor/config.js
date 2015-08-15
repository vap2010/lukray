CKEDITOR.editorConfig = function (config) {
  // ... other configuration ...

  config.toolbar_mini = [
    ["Bold",  "Italic",  "Underline",  "Strike",  "-",  "Subscript",  "Superscript", "-", "Source"],
  ];
  config.toolbar = "simple";

  config.filebrowserImageBrowseUrl = '/images';
  config.filebrowserImageUploadUrl = '/images';  
  
  // ... rest of the original config.js  ...
}


/*

 'Source', 'Bold', 'Italic', 'Underline', 'BulletedList', 'Link', 'Unlink', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', 'Font', 'FontSize', 'TextColor', 'About', 'NewPage', 'Preview', 'Templates', 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', 'Undo', 'Redo', 'Strike', 'Image', 'Table', 'HorizontalRule', 'BGColor', 'Liststyle', 'NumberedList', 'BulletedList','Outdent','Indent','Blockquote'

*/