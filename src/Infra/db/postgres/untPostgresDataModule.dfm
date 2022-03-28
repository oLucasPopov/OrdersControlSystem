object dmPostgres: TdmPostgres
  OldCreateOrder = False
  Height = 150
  Width = 251
  object fdPgConnection: TFDConnection
    Params.Strings = (
      'Pooled='
      'Database=my_erp'
      'User_Name=postgres'
      'Password=senha123'
      'Server=127.0.0.1'
      'DriverID=PG')
    LoginPrompt = False
    Left = 43
    Top = 9
  end
  object fdPgTransaction: TFDTransaction
    Connection = fdPgConnection
    Left = 128
    Top = 8
  end
end
