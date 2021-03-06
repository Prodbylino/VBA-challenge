Attribute VB_Name = "Module1"
Sub stock_summary()


  ' Set an initial variable for the ticker code
  Dim Ticker As String

  ' Set an initial variable for yearly change
  Dim Yearly_Change As Double
  Yearly_Change = 0
  
  Dim Yearly_change_percentage As Double
  
  

  
  ' Set an initial variable for total stock volume
  Dim Total_Volume As LongLong
  
  Total_Volume = 0
  
  ' Keep track of the location for each ticker in the summary table
  Dim Summary_Table_Row As Long
  

  Summary_Table_Row = 2
  

   'set header
   
   
   Cells(1, 9).Value = "Ticker"
   Cells(1, 10).Value = "Yearly Change"
   Cells(1, 11).Value = "Percent Change"
   Cells(1, 12).Value = "Total Stock Volume"
   
   
   'set open price for initial
   Open_price = Cells(2, 3).Value
   
   
   
  ' Loop through all row
  
  lastrow = Cells(Rows.Count, 1).End(xlUp).Row
  
  For i = 2 To lastrow

    ' if the row below is differnet stock from last row
    
    If Cells(i + 1, 1).Value <> Cells(i, 1).Value Then

      ' Set the tiker name
      Ticker = Cells(i, 1).Value
        ' Total volume
    
     Total_Volume = Total_Volume + Cells(i, 7).Value
   
      ' close price
      Close_price = Cells(i, 6).Value
    
      ' Add yearly change
      
     Yearly_Change = Close_price - Open_price
     
     ' next open price
     
     Open_price = Cells(i + 1, 3).Value
     
     
    

      ' Print the ticker name in the Summary Table
      Range("I" & Summary_Table_Row).Value = Ticker
      

      ' Print the total volume to summary table
      Range("L" & Summary_Table_Row).Value = Total_Volume
      
      Range("J" & Summary_Table_Row).Value = Yearly_Change
      
      
      Yearly_change_percentage = Yearly_Change / Cells(i, 3).Value
      
      Range("K" & Summary_Table_Row).Value = FormatPercent(Yearly_change_percentage, , , vbTrue)
      

      ' Add one to the summary table row
      Summary_Table_Row = Summary_Table_Row + 1
      
      ' Reset the Total Volume
      Total_Volume = 0
      Yearly_Change = 0
      
      ElseIf Cells(i, 10).Value < 0 Then
      
      
      Cells(i, 10).Interior.ColorIndex = 3
      
      ElseIf Cells(i, 10).Value > 0 Then
      
      
      Cells(i, 10).Interior.ColorIndex = 4

    ' If the cell immediately following a row is the same stock
    Else

      ' Add Total Volume
      Total_Volume = Total_Volume + Cells(i, 7).Value
    

    End If

   
   
  Next i
  
  


End Sub

