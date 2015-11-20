function dbupdate
	set databaseUser root
	set databaseNames medhub medhub_reports
	set scriptPaths ~/src/medhub/git-medhub/app/_database-sync/12-1.sql ~/src/medhub/git-medhub/app/_database-sync/12-1_reports.sql

	echo Updating databases
	echo Enter MySQL root user password:
	read databasePassword

	echo (seq (count $databaseNames))
	for index in (seq (count $databaseNames))
		echo \n
		echo $databaseNames[$index]
		echo $databaseNames[$index] | tr [:print:] =
		mysql -f -u $databaseUser -p$databasePassword $databaseNames[$index] < $scriptPaths[$index]
	end

end
