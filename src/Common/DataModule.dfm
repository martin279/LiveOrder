object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 888
  Top = 238
  Height = 358
  Width = 264
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 16
  end
  object ADODataSet1: TADODataSet
    Parameters = <>
    Left = 136
    Top = 16
  end
  object ADOConnection2: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 72
  end
  object ADOStoredProc1: TADOStoredProc
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    ProcedureName = 'sp_GetSerialNumber;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@SequenceStyle'
        Attributes = [paNullable]
        DataType = ftString
        Size = 1
        Value = Null
      end
      item
        Name = '@SerialNumber'
        Attributes = [paNullable]
        DataType = ftString
        Direction = pdInputOutput
        Size = 9
        Value = Null
      end>
    Prepared = True
    Left = 136
    Top = 80
  end
  object ADOConnection3: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 128
  end
end
