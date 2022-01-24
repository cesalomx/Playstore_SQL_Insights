--Finding the list of the top 25 developer's Id (Company/publisher) which has the most published apps on Google Playstore 
SELECT TOP 25 Developer_Id,COUNT(App_Name) AS TotalApps FROM dbo.app AS t1
INNER JOIN dbo.install AS t2 ON t1.Install_Id=t2.Install_Id
INNER JOIN dbo.developer AS t3 ON t1.Devs_Id=t3.Devs_Id
GROUP BY Developer_Id
HAVING COUNT(App_Name) > 1000
ORDER BY totalapps DESC

--Finding the list of the top 25 most expensive apps on playstore