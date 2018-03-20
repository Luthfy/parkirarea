<script type="text/javascript">
    function Login()
    {
        var username = document.login.username.value;
            username = username.toLowerCase();

        var password = document.login.password.value;
            password = password.toLowerCase();

        if (username == "admin" && password == "admin") {
            alert ("Selamat Anda Berhasil Login");
        } else {
            alert ("Username dan Password anda salah");
        }
    }
</script>

<body>
    <form class="login" action="" name="login">
        <table width="225" cellpadding="4">
            <tr>
                <td>Username</td><td><input type="text" name="username"></td>
            </tr>
            <tr>
                <td>Password</td><td><input type="text" name="password"></td>
            </tr>
            <tr>
                <td colspan="2" align="right"><input type="button" value="Login" onClick="Login()"></td>
            </tr>
        </table>
    </form>
</body>
