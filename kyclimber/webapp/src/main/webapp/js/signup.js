$(document).ready(function() {

    $("#btnSubmitSignupForm").on("click", function (e) {
       e.preventDefault();
       let passInput = $("#password");
       let passMD5 =  md5(passInput.val());
       passInput.val(passMD5);
       $("#signupForm").submit();
    });
});
