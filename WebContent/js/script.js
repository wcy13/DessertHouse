/**
 * 提示框
 */
function toaster(message, type) {
    var toaster = $("#toaster");
    if (type == "success"){
    	toaster.append('<div class="toast-item"><i class="fa fa-smile-o fa-lg toaster-icon"></i>' + message + '</div>');
    	 var thisItem = toaster.children().last();
    	 thisItem.addClass("success");
    } else{
    	toaster.append('<div class="toast-item"><i class="fa fa-frown-o fa-lg toaster-icon"></i>' + message + '</div>');
   	 	var thisItem = toaster.children().last();
   	 	thisItem.addClass("error");
    }
    thisItem.slideDown(100);
    setTimeout(function() {
        thisItem.slideUp(100,function() {
            thisItem.remove();
        });
    }, 2000);
}