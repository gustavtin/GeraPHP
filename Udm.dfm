object dmgeral: Tdmgeral
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 866
  Top = 120
  Height = 312
  Width = 270
  object upcampos: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ID_CAMPO,'
      '  ID_CLASSE,'
      '  CAMPO,'
      '  TIPO,'
      '  CHAVE,'
      '  PADRAO,'
      '  TAMANHO,'
      '  MINIMO,'
      '  OBRIGATORIO,'
      '  LISTAR,'
      '  UNICO,'
      '  CDEC'
      'from CAMPOS_CLASSE '
      'where'
      '  ID_CAMPO = :ID_CAMPO')
    ModifySQL.Strings = (
      'update CAMPOS_CLASSE'
      'set'
      '  ID_CLASSE = :ID_CLASSE,'
      '  CAMPO = :CAMPO,'
      '  TIPO = :TIPO,'
      '  CHAVE = :CHAVE,'
      '  PADRAO = :PADRAO,'
      '  TAMANHO = :TAMANHO,'
      '  MINIMO = :MINIMO,'
      '  OBRIGATORIO = :OBRIGATORIO,'
      '  LISTAR = :LISTAR,'
      '  UNICO = :UNICO,'
      '  CDEC = :CDEC'
      'where'
      '  ID_CAMPO = :OLD_ID_CAMPO')
    InsertSQL.Strings = (
      'insert into CAMPOS_CLASSE'
      '  (ID_CLASSE, CAMPO, TIPO, CHAVE, PADRAO, TAMANHO, MINIMO, '
      'OBRIGATORIO, '
      '   LISTAR, UNICO, CDEC)'
      'values'
      
        '  (:ID_CLASSE, :CAMPO, :TIPO, :CHAVE, :PADRAO, :TAMANHO, :MINIMO' +
        ', '
      ':OBRIGATORIO, '
      '   :LISTAR, :UNICO, :CDEC)')
    DeleteSQL.Strings = (
      'delete from CAMPOS_CLASSE'
      'where'
      '  ID_CAMPO = :OLD_ID_CAMPO')
    Left = 144
    Top = 128
  end
  object upclasses: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ID_CLASSE,'
      '  NOME,'
      '  CATEGORIA,'
      '  OPCOES'
      'from CLASSES '
      'where'
      '  ID_CLASSE = :ID_CLASSE')
    ModifySQL.Strings = (
      'update CLASSES'
      'set'
      '  NOME = :NOME,'
      '  CATEGORIA = :CATEGORIA,'
      '  OPCOES = :OPCOES'
      'where'
      '  ID_CLASSE = :OLD_ID_CLASSE')
    InsertSQL.Strings = (
      'insert into CLASSES'
      '  (NOME, CATEGORIA, OPCOES)'
      'values'
      '  (:NOME, :CATEGORIA, :OPCOES)')
    DeleteSQL.Strings = (
      'delete from CLASSES'
      'where'
      '  ID_CLASSE = :OLD_ID_CLASSE')
    Left = 152
    Top = 184
  end
  object ibclasses: TIBQuery
    Database = dbcode
    Transaction = IBTransaction1
    AfterOpen = ibclassesAfterOpen
    AfterPost = ibclassesAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CLASSES')
    UpdateObject = upclasses
    Left = 96
    Top = 176
    object ibclassesID_CLASSE: TIntegerField
      FieldName = 'ID_CLASSE'
      Origin = 'CLASSES.ID_CLASSE'
    end
    object ibclassesNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'CLASSES.NOME'
      Required = True
      Size = 30
    end
    object ibclassesCATEGORIA: TIBStringField
      FieldName = 'CATEGORIA'
      Origin = 'CLASSES.CATEGORIA'
      Required = True
      Size = 30
    end
    object ibclassesOPCOES: TIBStringField
      FieldName = 'OPCOES'
      Origin = 'CLASSES.OPCOES'
      Size = 200
    end
  end
  object ibcampos: TIBQuery
    Database = dbcode
    Transaction = ibt1
    AfterInsert = ibcamposAfterInsert
    AfterPost = ibcamposAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsclasses
    SQL.Strings = (
      'select * from CAMPOS_CLASSE'
      'where id_classe=:id_classe')
    UpdateObject = upcampos
    Left = 96
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_CLASSE'
        ParamType = ptUnknown
        Size = 4
      end>
    object ibcamposID_CAMPO: TIntegerField
      FieldName = 'ID_CAMPO'
      Origin = 'CAMPOS_CLASSE.ID_CAMPO'
    end
    object ibcamposID_CLASSE: TIntegerField
      FieldName = 'ID_CLASSE'
      Origin = 'CAMPOS_CLASSE.ID_CLASSE'
      Required = True
    end
    object ibcamposTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = 'CAMPOS_CLASSE.TIPO'
      Required = True
      OnGetText = ibcamposTIPOGetText
      OnSetText = ibcamposTIPOSetText
      Size = 2
    end
    object ibcamposCHAVE: TIBStringField
      FieldName = 'CHAVE'
      Origin = 'CAMPOS_CLASSE.CHAVE'
      FixedChar = True
      Size = 1
    end
    object ibcamposPADRAO: TIBStringField
      FieldName = 'PADRAO'
      Origin = 'CAMPOS_CLASSE.PADRAO'
      Size = 30
    end
    object ibcamposCAMPO: TIBStringField
      FieldName = 'CAMPO'
      Origin = 'CAMPOS_CLASSE.CAMPO'
      Required = True
      Size = 30
    end
    object ibcamposTAMANHO: TIntegerField
      FieldName = 'TAMANHO'
      Origin = 'CAMPOS_CLASSE.TAMANHO'
    end
    object ibcamposMINIMO: TIntegerField
      FieldName = 'MINIMO'
      Origin = 'CAMPOS_CLASSE.MINIMO'
    end
    object ibcamposOBRIGATORIO: TIBStringField
      FieldName = 'OBRIGATORIO'
      Origin = 'CAMPOS_CLASSE.OBRIGATORIO'
      FixedChar = True
      Size = 1
    end
    object ibcamposLISTAR: TIBStringField
      FieldName = 'LISTAR'
      Origin = 'CAMPOS_CLASSE.LISTAR'
      FixedChar = True
      Size = 1
    end
    object ibcamposUNICO: TIBStringField
      FieldName = 'UNICO'
      Origin = 'CAMPOS_CLASSE.UNICO'
      FixedChar = True
      Size = 1
    end
    object ibcamposCDEC: TSmallintField
      FieldName = 'CDEC'
      Origin = 'CAMPOS_CLASSE.CDEC'
    end
  end
  object dbcode: TIBDatabase
    Connected = True
    DatabaseName = 'GERACODE.GDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = []
    Left = 40
    Top = 56
  end
  object IBTransaction1: TIBTransaction
    Active = True
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 40
    Top = 8
  end
  object dscampos: TDataSource
    DataSet = ibcampos
    Left = 40
    Top = 120
  end
  object dsclasses: TDataSource
    DataSet = ibclasses
    Left = 40
    Top = 168
  end
  object ibt1: TIBTransaction
    Active = True
    DefaultDatabase = dbcode
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 216
    Top = 24
  end
  object upcodes: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  DESCRICAO,'
      '  CATEGORIA,'
      '  ID,'
      '  LINGUA,'
      '  GRAVAR,'
      '  PASTA'
      'from CODIGOS '
      'where'
      '  ID = :ID')
    ModifySQL.Strings = (
      'update CODIGOS'
      'set'
      '  CODIGO = :CODIGO,'
      '  DESCRICAO = :DESCRICAO,'
      '  CATEGORIA = :CATEGORIA,'
      '  LINGUA = :LINGUA,'
      '  GRAVAR = :GRAVAR,'
      '  PASTA = :PASTA'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into CODIGOS'
      '  (CODIGO, DESCRICAO, CATEGORIA, LINGUA, GRAVAR, PASTA)'
      'values'
      '  (:CODIGO, :DESCRICAO, :CATEGORIA, :LINGUA, :GRAVAR, :PASTA)')
    DeleteSQL.Strings = (
      'delete from CODIGOS'
      'where'
      '  ID = :OLD_ID')
    Left = 160
    Top = 232
  end
  object ibcodes: TIBQuery
    Database = dbcode
    Transaction = ibt1
    AfterPost = ibcodesAfterPost
    BeforePost = ibcodesBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsclasses
    SQL.Strings = (
      'select *  from CODIGOS')
    UpdateObject = upcodes
    Left = 96
    Top = 232
    object ibcodesCODIGO: TBlobField
      FieldName = 'CODIGO'
      Origin = 'CODIGOS.CODIGO'
      BlobType = ftMemo
      Size = 8
    end
    object ibcodesDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'CODIGOS.DESCRICAO'
      Size = 255
    end
    object ibcodesCATEGORIA: TIBStringField
      FieldName = 'CATEGORIA'
      Origin = 'CODIGOS.CATEGORIA'
      Size = 30
    end
    object ibcodesID: TIntegerField
      FieldName = 'ID'
      Origin = 'CODIGOS.ID'
    end
    object ibcodesLINGUA: TIBStringField
      FieldName = 'LINGUA'
      Origin = 'CODIGOS.LINGUA'
      Size = 15
    end
    object ibcodesGRAVAR: TSmallintField
      FieldName = 'GRAVAR'
      Origin = 'CODIGOS.GRAVAR'
    end
    object ibcodesPASTA: TIBStringField
      FieldName = 'PASTA'
      Origin = 'CODIGOS.PASTA'
      Size = 250
    end
  end
  object dscodes1: TDataSource
    DataSet = ibcodes
    OnStateChange = dscodes1StateChange
    OnDataChange = dscodes1DataChange
    Left = 40
    Top = 224
  end
  object iblingua: TIBQuery
    Database = dbcode
    Transaction = ibt1
    AfterInsert = ibcamposAfterInsert
    AfterPost = ibcamposAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsclasses
    SQL.Strings = (
      'select distinct lingua from CODIGOS'
      'order by lingua')
    Left = 96
    Top = 80
  end
  object IBQuery1: TIBQuery
    Database = dbcode
    Transaction = IBTransaction1
    AfterOpen = ibclassesAfterOpen
    AfterPost = ibclassesAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CLASSES')
    Left = 136
    Top = 24
    object IntegerField1: TIntegerField
      FieldName = 'ID_CLASSE'
      Origin = 'CLASSES.ID_CLASSE'
    end
    object IBStringField1: TIBStringField
      FieldName = 'NOME'
      Origin = 'CLASSES.NOME'
      Required = True
      Size = 30
    end
    object IBStringField2: TIBStringField
      FieldName = 'CATEGORIA'
      Origin = 'CLASSES.CATEGORIA'
      Required = True
      Size = 30
    end
  end
end
