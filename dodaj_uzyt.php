<?php
	session_start();
	error_reporting(E_ERROR | E_PARSE); //wyłączenie pokazywanie błędów
	//WALIDACJA DANYCH Z FOMRULARZA
	if((!isset($_SESSION['zalogowany'])) || ($_SESSION['zalogowany']!=true) || $_SESSION['admin']!=1)
	{
		header('Location: index.php');
		exit();
	}

	if(isset($_POST['imie']))
	{
		$ok=true; //flaga poprawności

		//SPRAWDZANIE IMIENIA
		$imie=$_POST['imie'];
		if(strlen($imie)>20 || ctype_alnum($imie)==false) //imie ma wiecej niz 20 lub ma inne znaki
		{
			$_SESSION['bladi'] = "BŁĄD PRZY WPISYWANIU IMIENIA!";
			$ok=false; //niepoprawność danych
		}
		else
		{
			if(isset($_SESSION['bladi'])) unset($_SESSION['bladi']);
			$imie[0]=strtoupper($imie[0]); //zamiana pierwszej litery imienia na jej większy odpowiednik
		}

		//SPRAWDZANIE NAZWISKA
		$nazwisko=$_POST['nazwisko'];
		if(strlen($nazwisko)>28 || ctype_alnum($nazwisko)==false) //imie ma wiecej niz 28 lub ma inne znaki
		{
			$_SESSION['bladn'] = "BŁĄD PRZY WPISYWANIU NAZWISKA!";
			$ok=false; //niepoprawność danych
		}
		else
		{
			if(isset($_SESSION['bladn'])) unset($_SESSION['bladn']);
			$nazwisko[0]=strtoupper($nazwisko[0]); //zamiana pierwszej litery imienia na jej większy odpowiednik
		}

		//SPRAWDZANIE EMAILA
		$email=$_POST['email'];
		if(!filter_var($email, FILTER_VALIDATE_EMAIL))
		{
			$_SESSION['blade']="NIEPRAWIDŁOWY EMAIL!";
			$ok=false;
		}
		else
		{
			if(isset($_SESSION['blade'])) unset($_SESSION['blade']);
		}
		//SPRAWDZANIE LOGINU
		$login=$_POST['login'];
		if(strlen($login)<8 || ctype_alnum($login)==false)
		{
			$_SESSION['bladl']="BŁĄD PRZY WPISYWANIU LOGINU!";
			$ok=false;
		}
		else
		{
			if(isset($_SESSION['bladl'])) unset($_SESSION['bladl']);
		}
		//SPRAWDZANIE HASŁA
		$haslo=$_POST['haslo'];
		if(strlen($haslo)<8 || ctype_alnum($haslo)==false)
		{
			$_SESSION['bladh']="BŁĄD PRZY WPISYWANIU HASŁA!";
			$ok=false;
		}
		else
		{
			if(isset($_SESSION['bladh'])) unset($_SESSION['bladh']);
		}
		
		//WPROWADZANIE DO BAZY DANYCH
		if($ok==true) //JEŚLI WSZYSTKIE DANE SĄ POPRAWNE
		{
			$host = "localhost"; //adres hosta
			$name = "root";	//nazwa użytkownika
			$pass = "";	//hasło, jeśli nie ma zostawić puste
			$dbname = "projekt"; //nazwa bazy danych
			$conn = mysqli_connect($host, $name, $pass, $dbname); //połączenie z bazą danych
			
			if(mysqli_connect_errno())
			{
				header("Location: uzytkownicy.php");
				$_SESSION['bladc']="Problemy techniczne. Prosimy spróbować później.";
			}
			else
			{
				if(isset($_SESSION['bladc'])) unset($_SESSION['bladc']); //wyłączanie błędu połączenia
				$kwerenda="INSERT INTO uzytkownicy(imie, nazwisko, email, login, haslo) VALUES('$imie', '$nazwisko', '$email', '$login', '$haslo')";
				if(mysqli_query($conn, $kwerenda))
				{
					header("Location: uzytkownicy.php");
				}
				else
				{
					echo "Chwilowe problemy";
				}
				mysqli_close($conn);
			}
		}
		else
		{
			header("Location: uzytkownicy.php");
		}
	}
?>


