<?php
 session_start();
 error_reporting(E_ERROR | E_PARSE); //wyłączenie pokazywanie błędów

 if((!isset($_SESSION['zalogowany'])) || ($_SESSION['zalogowany']!=true))
	{
		header('Location: index.php');
		exit();
	}

?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/e7af9736bb.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="CSS/style-menu.css">
    <link rel="stylesheet" href="CSS/style-strona.css">
    <title>Dodawanie kas fiskalnych</title>
    <script src="Javascript/user-details.js" defer></script>
</head>
<body class="menu-preload">
    <div id='main'>
        <div id="heading-user">
            <div id="heading">
                <h1>Dodaj kasę fiskalną</h1>
            </div>
            <div id='logged-user'>
            	<span id="logged-user-icon"><i class="fas fa-user" onClick="managePopupWindow()"></i></span><?php echo "<p>".$_SESSION['imie']."</p>";?>
            </div>
        </div>
		<div class="content">
			<div class="position-middle-row1" id="dodaj-kase">
				<form method="POST">
                    <h2>KASA FISKALNA</h2>
                    <p><div class="formularz-heading" style="min-width:175px;">Model: </div><input class="dane-input" type="text" name="model"></p>
                    <p> <div class="formularz-heading" style="min-width:175px;">Numer unikatowy: </div><input class="dane-input" type="text" name="nr_unikatowy"></p>
                    <div class="formularz-heading" style="min-width:175px;">Klient: </div><input class="dane-input" type="text" name="nazwa">
                    <div class='button-dodaj'><input class="button" type="submit" value="Dodaj"></div>
				</form>
			</div>
			<?php
				$model=htmlentities($_POST['model'],ENT_QUOTES,"UTF-8");
				$nr_unikatowy=htmlentities($_POST['nr_unikatowy'],ENT_QUOTES,"UTF-8");
                $nazwa=htmlentities($_POST['nazwa'],ENT_QUOTES,"UTF-8");
		
				if((!empty($model))&&(!empty($nr_unikatowy))&&(!empty($nazwa))) //jeżeli te dwie zmienne nie są puste wykonaj
				{
					$host = "localhost"; //adres hosta
					$name = "root";	//nazwa użytkownika
					$pass = "";	//hasło, jeśli nie ma zostawić puste
					$dbname = "projekt"; //nazwa bazy danych
					$conn = mysqli_connect($host, $name, $pass, $dbname); //połączenie z bazą danych

					if(mysqli_connect_errno()) echo "Problemy techniczne, proszę spróbować później.";
					else
					{
						$aktualna_data=date('Y-m-d'); //pobieranie aktualnej daty
                        $kwerenda_klienci="SELECT id FROM klienci WHERE nazwa='$nazwa'";
                        if($wynik=mysqli_query($conn, $kwerenda_klienci))
						{
                            $id=mysqli_fetch_row($wynik);
							$kwerenda_kasy="INSERT INTO kasy(data_fisk, nr_unikatowy, model, kontrahent) VALUES('$aktualna_data', '$nr_unikatowy', '$model', $id[0])";
						    if(mysqli_query($conn, $kwerenda_kasy))
						    {
                                header("Location: dodawanieKasFiskalnych.php");
						    }
						}
						else echo "<center>Nie zapisano</center>";
                        mysqli_close($conn);
					}
				}
			?>
		</div>
        <!-- Znikające okna początek -->
        <div id="user-details-window">
            <p>Zalogowano jako:</p> <?php echo "<p>".$_SESSION['imie']." ".$_SESSION['nazwisko']."</p><p>@".$_SESSION['login']."</p>"; ?>
            <a href='logout.php'>Wyloguj</a>
        </div>
        <div>
            <input type="checkbox" id="menu-checkbox" onClick="checkState()">
            <label for="menu-checkbox" id="menu-checkbox2">
                <i class="fas fa-bars"></i>
            </label>
            <!-- Javascript - menu.js -->
            <script src="JavaScript/menu.js"></script>
            <!-- Javascript - menu.js -->  
            <div class='sidebar sidebar-position'>
                <div class='sidebar-header'>Menu</div>
                <ul class='sidebar-content-underline'>
                    <li><a href='menuKasFiskalnych.php'><i class="fas fa-bookmark"></i>Menu Główne</a></li>
                    <li><a href='przeglady.php'><i class="fas fa-cash-register"></i>Przeglądy</a></li>
                    <li><a href='listaKasFiskalnych.php'><i class="fas fa-list"></i>Lista kas fiskalnych</a></li>
                    <li><a href='dodawanieKasFiskalnych.php'><i class="fas fa-plus"></i>Dodaj kasę fisklaną</a></li>
                    <li><a href='dodawaniePrzegladow.php'><i class="far fa-calendar-plus"></i></i>Dodaj przegląd</a></li>
                    <li><a href='klienci.php'><i class="fas fa-id-card"></i>Klienci</a></li>
                    <li><a href='wyslijMaila.php'><i class="far fa-envelope"></i>Wyślij maila do klienta</a></li>
                    <?php 
                    if($_SESSION['admin']==1){
                        echo "<li><a href='uzytkownicy.php'><i class='fas fa-address-book'></i>Użytkownicy</a></li>";
                    }
                    ?>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>
