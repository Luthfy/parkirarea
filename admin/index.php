<!DOCTYPE html>
<html>

<head>
    <title>Administrator Parkir Area</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/animate.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap-select.min.css">
    <link rel="stylesheet" type="text/css" href="css/awesome-bootstrap-checkbox.css">
    <link rel="stylesheet" type="text/css" href="css/select2.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/theme.css">

    <script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/Chart.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-select.min.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
</head>

<body class="flat-blue sidebar-collapse">
    <div class="sidebar">
        <div class="menu-control toggle-sidebar">
            <a class="navbar-brand" href="#"><i class="fa fa-bar-chart"></i> ParkirArea</a>
            <i class="fa fa-bars navicon"></i>
        </div>
        <ul class="menu">
            <li class="submenu">
                <a href="index.php" onclick="activeElement()">
                    <div>
                        <i class="menu-icon fa fa-th-large"></i>
                        <span class="menu-title">Dashboard</span>
                    </div>
                </a>
            </li>

            <li class="submenu dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">

                    <div>
                        <i class="menu-icon fa fa-desktop"></i>
                        <span class="menu-title">Report</span>
                    </div>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="?pg=jparkir">
                            <div>
                                <i class="menu-icon fa fa-sign-in"></i>
                                <span class="menu-sub-title">Daftar Parkir</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="?pg=dbayar">
                            <div>
                                <i class="menu-icon fa fa-sign-in"></i>
                                <span class="menu-sub-title">Dibayarkan</span>
                            </div>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="submenu dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">

                    <div>
                        <i class="menu-icon fa fa-magic"></i>
                        <span class="menu-title">Master Petugas</span>
                    </div>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="?pg=vpetugas">
                            <div>
                                <i class="menu-icon fal fa-address-card"></i>
                                <span class="menu-sub-title">Daftar Petugas</span>
                            </div>
                        </a>
                    </li>

                    <li>
                        <a href="?pg=tpetugas">
                            <div>
                                <i class="menu-icon fal fa-address-card"></i>
                                <span class="menu-sub-title">Tambah Petugas</span>
                            </div>
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
    <div class="content-container">
        <nav class="navbar navbar-default">
            <div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#"><i class="fa fa-bar-chart"></i> Administrator ParkirArea</a>
                    </div>
                    <ul class="nav navbar-nav navbar-right">

                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Administrator <span class="caret"></span></a>
                            <ul class="dropdown-menu user-info">
                                <li class="dropdown-title-bar">
                                    <img src="images/profile.jpg" class="profile-img">
                                </li>
                                <li>
                                    <div class="navbar-login">
                                        <h4 class="user-name">Administrator</h4>
                                        <p>administrator@parkirarea.com</p>
                                        <div class="btn-group margin-bottom-2x" role="group">
                                            <button type="button" class="btn btn-default"><i class="fa fa-sign-out"></i> Logout</button>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>
        <div class="container-fluid">

            <div class="row">
                <div class="col-xs-12">
                    <span class="page-title"><h4>Dashboard</h4></span>
                </div>
            </div>
            <div class="row">

                <?php

                    switch ($_GET['pg']) {
                        case 'dashboard':
                            include 'dashboard.php';
                            break;

                        default:
                            echo "<script> location.href='index.php?pg=dashboard'; </script>";
                            break;
                    }

                ?>

            </div>
        </div>
    </div>

    <footer class="footer">
            <span><i class="fa fa-copyright"></i> Tui2Tone Labs, 2015</span>
    </footer>
</body>
    <script type="text/javascript">
        function activeElement()
        {
            var a = document.getElementsByTagName('i').class;

            alert(a);
        }
    </script>
</html>
