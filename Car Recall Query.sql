--This selects the entire table
Select *
From Recalls


--This picks specific columns in the table
Select Date, ID, Manufacturer
From Recalls
Order by Date 

--This picks the first 50 rows
Select Top 50 *
From Recalls

--This shows specific items within a column(Subject)
Select Distinct(Subject)
From Recalls

--This shows the SumTotal of items within a column
Select Count(subject) As SubectCount
From Recalls 

--This shows the item with the highest number within a column
Select Max(Type) As Maximumrecall
From Recalls

--This shows the item with the smallest number within a column
Select Min(Type)Minimumrecall
From Recalls

--This shows every item in the column 'subject' that has the word 'Lights' in it
Select *
From Recalls
where Subject like '%LIGHTS'

--This shows every 'Potentially Affected Item' above the sum of 900
Select *
From recalls
where [Potentially Affected] > 900 

--This identifies the specific items within a column
Select distinct Type
From Recalls

--This shows every 'Potentially Affected Item' below the sum of 900
Select date, ID, Manufacturer, Component, MFR_NUM, [Potentially Affected]
From recalls
where [Potentially Affected] < 900


--This shows every 'Potentially Affected Item' that's exactly the sum of 900
Select date, ID, Manufacturer, Component, MFR_NUM, [Potentially Affected]
From recalls
where [Potentially Affected] = 900

--This selects every item that has 'Fuel Filter' within the Potentially Affected AND is above 15,000  
Select date, ID, Manufacturer, Component, MFR_NUM, [Potentially Affected]
From recalls
where [Potentially Affected]> 15000 And  Subject LIKE '%Fuel Filter%'

--This selects every Potentially Affected that is above 20,000 or the Component is 'Steering'
Select date, ID, Manufacturer, Component, MFR_NUM, [Potentially Affected]
From recalls
where [Potentially Affected] > 20000 or Component ='Steering'


--This selects every 'Subject' that starts with the letter 'E'
Select date, ID, Manufacturer, Component, Subject, MFR_NUM, [Potentially Affected]
From recalls
where Subject like 'E%'


--This selects every 'Potentially Affected' starts with the letter 'E' and has the letter 'D' anywhere within it
Select date, ID, Manufacturer, Component, Subject, [Potentially Affected]
From recalls
where Subject like 'E%%d%'
Order by [Potentially Affected], Manufacturer desc


--This selects every 'Potentially Affected' that has the number '3' anywhere within it
Select Date, ID, Manufacturer, Component, Subject, MFR_NUM, [Potentially Affected] 
From recalls
where [Potentially Affected] like '%3%'



 --This selects all information from Type and 'Potentially Affected' column that is not null 
Select Date, ID, Manufacturer, Component, Subject,MFR_NUM
From recalls
where Type is not null AND [Potentially Affected] is not null


--This select only Exterior lighting and Engine and Engine Cooling Components
Select ID, Manufacturer, Component, Subject, [Potentially Affected]
From recalls
where Component in ('exterior lighting', 'engine and engine cooling')
Order by ID

--This selects and Groups the Subject column 
Select Subject
From recalls 
Group by Subject

--This shows the total number of Subject in respect to the Type
Select Subject, Type, count(Subject) As 'Subjectcount'
From recalls 
Group by Subject, Type 
Order by 'Subjectcount' desc



--This shows the total number of Component in respect to the Type
Select ID, Component, Type, Manufacturer, count(Manufacturer) As 'Componentcount'
From recalls 
where Type is not null and Manufacturer is not null 
Group by ID, Manufacturer, Component, Type
Order by Component 




--Creating View As Potentially_Affected
Create View Affected As
Select date, ID, Manufacturer, Component, MFR_NUM, [Potentially Affected]
From recalls
where [Potentially Affected] > 20000 or Component ='Steering'

