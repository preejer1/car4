// Set maximum file upload size to 100 KB. Display preview on load with preset files/images and captions
// with `overwriteInitial` set to false. So the initial preview is always displayed when additional files 
// are overwritten (useful for multiple upload) scenario.
<input id="input-24" type="file" multiple="true">
$("#input-24").fileinput({
    initialPreview: [
        "<img src='/images/moon.jpg' class='file-preview-image' alt='The Moon' title='The Moon'>",
        "<img src='/images/earth.jpg' class='file-preview-image' alt='The Earth' title='The Earth'>",
    ],
    overwriteInitial: false,
    maxFileSize: 100,
    initialCaption: "The Moon and the Earth"
});
 
// Display preview on load with preset files/images and captions
// with `overwriteInitial` set to true.
<input id="input-25" type="file" multiple="true">
$("#input-25").fileinput({
    initialPreview: [
        "<img src='/images/moon.jpg' class='file-preview-image' alt='The Moon' title='The Moon'>",
        "<img src='/images/earth.jpg' class='file-preview-image' alt='The Earth' title='The Earth'>",
    ],
    overwriteInitial: true,
    initialCaption: "The Moon and the Earth"
});
 
// Display the widget as a single block button
<input id="input-20" type="file">
/* Initialize your widget via javascript as follows */
$("#input-20").fileinput({
	browseClass: "btn btn-primary btn-block",
	showCaption: false,
	showRemove: false,
	showUpload: false
});
 
// Show only image files for selection & preview. Control button labels, styles, 
// and icons for the browse, upload, and remove buttons.
<input id="input-21" type="file" accept="image/*" >
<script>
/* Initialize your widget via javascript as follows */
$("#input-21").fileinput({
	previewFileType: "image",
	browseClass: "btn btn-success",
	browseLabel: "Pick Image",
	browseIcon: '<i class="glyphicon glyphicon-picture"></i>',
	removeClass: "btn btn-danger",
	removeLabel: "Delete",
	removeIcon: '<i class="glyphicon glyphicon-trash"></i>',
	uploadClass: "btn btn-info",
	uploadLabel: "Upload",
	uploadIcon: '<i class="glyphicon glyphicon-upload"></i>',
});
</script>
 
// Preview section control. Change preview background and allow text files ONLY 
// for selection as well as preview.
<input id="input-22" type="file" class="file-loading" accept="text/plain" multiple=true>
<script>
$("#input-22").fileinput({
    previewFileType: "text",
    allowedFileExtensions: ["txt", "md", "ini", "text"],
    previewClass: "bg-warning"
});
</script>
 
// Advanced customization using templates. For example, change position of buttons 
// from right to left.
<input id="input-23" type="file" multiple="true">
<script>
$("#input-23").fileinput({
	showUpload: false,
	layoutTemplates: {
        main1: "{preview}\n" +
        "<div class=\'input-group {class}\'>\n" +
        "   <div class=\'input-group-btn\'>\n" +
        "       {browse}\n" +
        "       {upload}\n" +
        "       {remove}\n" +
        "   </div>\n" +
        "   {caption}\n" +
        "</div>"
    }
});
</script>
 
// Using plugin methods to alter input at runtime. For example, click the 
// Modify button to disable the plugin and change plugin options.
<input id="input-40" type="file" class="file" multiple=true>
<script>
$(".btn-modify").on("click", function() {
    $btn = $(this);
    if ($btn.text() == "Modify") {
        $("#input-40").fileinput("disable");
        $btn.html("Revert");
        alert("Hurray! I have disabled the input and hidden the upload button.");
    }
    else {
        $("#input-40").fileinput("enable");
        $btn.html("Modify");
        alert("Hurray! I have reverted back the input to enabled with the upload button.");
    }
});
</script>
 
// Allow only image and video file types to be uploaded. You can configure 
// the condition for validating the file types using `fileTypeSettings`.
<input id="input-41" type="file" multiple=true>
<script>
$("#input-41").fileinput({
    maxFileCount: 10,
    allowedFileTypes: ["image", "video"]
});
</script>
 
// Allow only specific file extensions to be uploaded. 
<input id="input-42" type="file" multiple=true>
<script>
$("#input-42").fileinput({
    maxFileCount: 10,
    allowedFileExtensions: ["jpg", "gif", "png", "txt"]
});
</script>
 
// Disable preview and customize your own error container and messages.
<input id="input-43" type="file" multiple=true>
<div id="errorBlock43" class="help-block"></div>
<script>
$("#input-43").fileinput({
    showPreview: false,
    allowedFileExtensions: ["zip", "rar", "gz", "tgz"],
    elErrorContainer: "#errorBlock43"
    // you can configure `msgErrorClass` and `msgInvalidFileExtension` as well
});
</script>