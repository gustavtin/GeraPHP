object fgeracode: Tfgeracode
  Left = 327
  Top = 194
  Width = 892
  Height = 597
  Caption = 'Gerador de C'#243'digos PHP'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl
    Left = 0
    Top = 0
    Width = 884
    Height = 570
    ActivePage = TabSheet1
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Gerador PHP'
      object jsformulario: TPageControl
        Left = 465
        Top = 0
        Width = 411
        Height = 539
        ActivePage = ts1
        Align = alClient
        TabOrder = 1
        object tsmysql: TTabSheet
          Caption = 'Create Mysql'
          ImageIndex = 9
          object syncreatemy: TSynMemo
            Left = 0
            Top = 0
            Width = 403
            Height = 504
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            TabOrder = 0
            Gutter.Font.Charset = DEFAULT_CHARSET
            Gutter.Font.Color = clWindowText
            Gutter.Font.Height = -11
            Gutter.Font.Name = 'Courier New'
            Gutter.Font.Style = []
            Gutter.ShowLineNumbers = True
            Gutter.Gradient = True
            Highlighter = SynSQLSyn1
          end
        end
        object ts3: TTabSheet
          Caption = 'Classe'
          ImageIndex = 2
          object mclasse: TSynMemo
            Left = 0
            Top = 0
            Width = 403
            Height = 504
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            TabOrder = 0
            Gutter.Font.Charset = DEFAULT_CHARSET
            Gutter.Font.Color = clWindowText
            Gutter.Font.Height = -11
            Gutter.Font.Name = 'Courier New'
            Gutter.Font.Style = []
            Gutter.ShowLineNumbers = True
            Gutter.Gradient = True
            Highlighter = SynPHPSyn1
          end
        end
        object ts4: TTabSheet
          Caption = 'Insert'
          ImageIndex = 3
          TabVisible = False
          object minsert: TSynMemo
            Left = 0
            Top = 0
            Width = 403
            Height = 504
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            TabOrder = 0
            Gutter.Font.Charset = DEFAULT_CHARSET
            Gutter.Font.Color = clWindowText
            Gutter.Font.Height = -11
            Gutter.Font.Name = 'Courier New'
            Gutter.Font.Style = []
            Gutter.ShowLineNumbers = True
            Gutter.Gradient = True
            Highlighter = SynPHPSyn1
          end
        end
        object ts5: TTabSheet
          Caption = 'Update'
          ImageIndex = 4
          TabVisible = False
          object mupdate: TSynMemo
            Left = 0
            Top = 0
            Width = 403
            Height = 504
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            TabOrder = 0
            Gutter.Font.Charset = DEFAULT_CHARSET
            Gutter.Font.Color = clWindowText
            Gutter.Font.Height = -11
            Gutter.Font.Name = 'Courier New'
            Gutter.Font.Style = []
            Gutter.ShowLineNumbers = True
            Gutter.Gradient = True
            Highlighter = SynPHPSyn1
          end
        end
        object ts7: TTabSheet
          Caption = 'Detalhes'
          ImageIndex = 6
          TabVisible = False
          object mdetalhes: TSynMemo
            Left = 0
            Top = 0
            Width = 403
            Height = 504
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            TabOrder = 0
            Gutter.Font.Charset = DEFAULT_CHARSET
            Gutter.Font.Color = clWindowText
            Gutter.Font.Height = -11
            Gutter.Font.Name = 'Courier New'
            Gutter.Font.Style = []
            Gutter.ShowLineNumbers = True
            Gutter.Gradient = True
            Highlighter = SynPHPSyn1
          end
        end
        object ts2: TTabSheet
          Caption = 'Busca'
          ImageIndex = 1
          object mbusca: TSynMemo
            Left = 0
            Top = 0
            Width = 403
            Height = 504
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            TabOrder = 0
            Gutter.Font.Charset = DEFAULT_CHARSET
            Gutter.Font.Color = clWindowText
            Gutter.Font.Height = -11
            Gutter.Font.Name = 'Courier New'
            Gutter.Font.Style = []
            Gutter.ShowLineNumbers = True
            Gutter.Gradient = True
            Highlighter = SynPHPSyn1
          end
        end
        object ts10: TTabSheet
          Caption = 'Listagem'
          ImageIndex = 8
          object ckexcl: TCheckBox
            Left = 136
            Top = 16
            Width = 57
            Height = 17
            Caption = 'excluir'
            Checked = True
            State = cbChecked
            TabOrder = 3
          end
          object ckincl: TCheckBox
            Left = 16
            Top = 16
            Width = 49
            Height = 17
            Caption = 'incluir'
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
          object ckaltl: TCheckBox
            Left = 72
            Top = 16
            Width = 57
            Height = 17
            Caption = 'alterar'
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
          object mlist: TSynMemo
            Left = 0
            Top = 41
            Width = 403
            Height = 463
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            TabOrder = 4
            Gutter.Font.Charset = DEFAULT_CHARSET
            Gutter.Font.Color = clWindowText
            Gutter.Font.Height = -11
            Gutter.Font.Name = 'Courier New'
            Gutter.Font.Style = []
            Highlighter = SynPHPSyn1
          end
          object pnl2: TPanel
            Left = 0
            Top = 0
            Width = 403
            Height = 41
            Align = alTop
            TabOrder = 0
            object ckdetl: TCheckBox
              Left = 24
              Top = 8
              Width = 81
              Height = 17
              Caption = 'detalhes'
              Checked = True
              State = cbChecked
              TabOrder = 0
            end
          end
        end
        object ts8: TTabSheet
          Caption = 'jsformulario'
          ImageIndex = 7
          object mjsform: TSynMemo
            Left = 0
            Top = 0
            Width = 403
            Height = 504
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            TabOrder = 0
            Gutter.Font.Charset = DEFAULT_CHARSET
            Gutter.Font.Color = clWindowText
            Gutter.Font.Height = -11
            Gutter.Font.Name = 'Courier New'
            Gutter.Font.Style = []
            Highlighter = SynJScriptSyn1
          end
        end
        object ts1: TTabSheet
          Caption = 'Formulario'
          object mform: TSynMemo
            Left = 0
            Top = 73
            Width = 403
            Height = 438
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            TabOrder = 1
            Gutter.Font.Charset = DEFAULT_CHARSET
            Gutter.Font.Color = clWindowText
            Gutter.Font.Height = -11
            Gutter.Font.Name = 'Courier New'
            Gutter.Font.Style = []
            Highlighter = SynPHPSyn1
          end
          object pnl1: TPanel
            Left = 0
            Top = 0
            Width = 403
            Height = 73
            Align = alTop
            TabOrder = 0
            object lbl3: TLabel
              Left = 320
              Top = 3
              Width = 54
              Height = 13
              Caption = 'Nome form.'
            end
            object Edit1: TEdit
              Left = 320
              Top = 16
              Width = 65
              Height = 21
              TabOrder = 4
            end
            object fmail: TCheckBox
              Left = 192
              Top = 16
              Width = 97
              Height = 17
              Caption = 'email'
              TabOrder = 2
            end
            object ckeditor: TCheckBox
              Left = 192
              Top = 32
              Width = 57
              Height = 17
              Caption = 'Editor'
              Checked = True
              State = cbChecked
              TabOrder = 7
            end
            object finc: TCheckBox
              Left = 80
              Top = 16
              Width = 97
              Height = 17
              Caption = 'incluir'
              Checked = True
              State = cbChecked
              TabOrder = 1
            end
            object fdet: TCheckBox
              Left = 80
              Top = 32
              Width = 73
              Height = 17
              Caption = 'detalhes'
              Checked = True
              State = cbChecked
              TabOrder = 6
            end
            object fexc: TCheckBox
              Left = 24
              Top = 32
              Width = 57
              Height = 17
              Caption = 'excluir'
              Checked = True
              State = cbChecked
              TabOrder = 5
            end
            object falt: TCheckBox
              Left = 24
              Top = 16
              Width = 49
              Height = 17
              Caption = 'alterar'
              Checked = True
              State = cbChecked
              TabOrder = 0
            end
            object ckmoeda: TCheckBox
              Left = 256
              Top = 16
              Width = 57
              Height = 17
              Caption = 'Moeda'
              Checked = True
              State = cbChecked
              TabOrder = 3
            end
            object ckjs: TCheckBox
              Left = 256
              Top = 32
              Width = 57
              Height = 17
              Caption = 'Verificar'
              Checked = True
              State = cbChecked
              TabOrder = 8
            end
            object chuser: TCheckBox
              Left = 80
              Top = 48
              Width = 89
              Height = 17
              Caption = 'seta user_id'
              Checked = True
              State = cbChecked
              TabOrder = 9
            end
            object ckms: TCheckBox
              Left = 192
              Top = 48
              Width = 97
              Height = 17
              Caption = 'monta select'
              TabOrder = 10
            end
          end
        end
        object ts6: TTabSheet
          Caption = 'Op'#231#245'es'
          ImageIndex = 5
          DesignSize = (
            403
            511)
          object lbl1: TLabel
            Left = 24
            Top = 24
            Width = 58
            Height = 13
            Caption = 'Padr'#227'o data'
          end
          object lbl2: TLabel
            Left = 24
            Top = 56
            Width = 60
            Height = 13
            Caption = 'Padr'#227'o Hora'
          end
          object Label8: TLabel
            Left = 48
            Top = 88
            Width = 35
            Height = 13
            Caption = 'charset'
          end
          object Label12: TLabel
            Left = 40
            Top = 144
            Width = 32
            Height = 13
            Caption = 'Output'
          end
          object edpdata: TEdit
            Left = 88
            Top = 24
            Width = 121
            Height = 21
            TabOrder = 0
            Text = 'date('#39'd/m/Y'#39')'
          end
          object edphora: TEdit
            Left = 88
            Top = 56
            Width = 121
            Height = 21
            TabOrder = 1
            Text = 'date("H:m")'
          end
          object cbcharset: TComboBox
            Left = 88
            Top = 88
            Width = 121
            Height = 21
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 2
            Text = 'iso'
            Items.Strings = (
              'iso'
              'utf')
          end
          object eddiretorio: TcxButtonEdit
            Left = 80
            Top = 144
            Width = 271
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
            Style.BorderStyle = ebs3D
            TabOrder = 3
          end
          object cxButton1: TcxButton
            Left = 80
            Top = 408
            Width = 271
            Height = 33
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Salvar Classe'
            TabOrder = 6
            OnClick = cxButton1Click
          end
          object cxButton2: TcxButton
            Left = 80
            Top = 168
            Width = 271
            Height = 33
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Preparar'
            TabOrder = 4
            OnClick = cxButton2Click
          end
          object listbox: TcxCheckListBox
            Left = 80
            Top = 208
            Width = 273
            Height = 193
            Columns = 0
            EditValue = 0
            Items = <>
            ParentColor = False
            ScrollWidth = 0
            TabOrder = 5
            TabWidth = 0
          end
        end
        object tsajax: TTabSheet
          Caption = 'Ajax'
          ImageIndex = 10
          object majax: TSynMemo
            Left = 0
            Top = 0
            Width = 403
            Height = 504
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            TabOrder = 0
            Gutter.Font.Charset = DEFAULT_CHARSET
            Gutter.Font.Color = clWindowText
            Gutter.Font.Height = -11
            Gutter.Font.Name = 'Courier New'
            Gutter.Font.Style = []
            Highlighter = SynPHPSyn1
          end
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 465
        Height = 539
        Align = alLeft
        TabOrder = 0
        object GroupBox1: TGroupBox
          Left = 1
          Top = 1
          Width = 463
          Height = 177
          Align = alTop
          Caption = 'Classes'
          TabOrder = 0
          object Label4: TLabel
            Left = 184
            Top = 40
            Width = 31
            Height = 13
            Caption = 'Classe'
          end
          object Label5: TLabel
            Left = 184
            Top = 80
            Width = 45
            Height = 13
            Caption = 'Categoria'
          end
          object DBGrid2: TDBGrid
            Left = 8
            Top = 16
            Width = 169
            Height = 153
            DataSource = dmgeral.dsclasses
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'ID_CLASSE'
                Title.Caption = 'Cod'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOME'
                Title.Caption = 'Classe'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CATEGORIA'
                Title.Caption = 'Categoria'
                Width = 64
                Visible = True
              end>
          end
          object DBNavigator1: TDBNavigator
            Left = 185
            Top = 16
            Width = 250
            Height = 25
            DataSource = dmgeral.dsclasses
            TabOrder = 1
          end
          object DBEdit3: TDBEdit
            Left = 184
            Top = 56
            Width = 121
            Height = 21
            DataField = 'NOME'
            DataSource = dmgeral.dsclasses
            TabOrder = 3
          end
          object DBEdit4: TDBEdit
            Left = 184
            Top = 96
            Width = 121
            Height = 21
            DataField = 'CATEGORIA'
            DataSource = dmgeral.dsclasses
            TabOrder = 5
          end
          object Button1: TButton
            Left = 184
            Top = 120
            Width = 121
            Height = 25
            Caption = 'Gerar C'#243'digos PHP'
            TabOrder = 6
            OnClick = Button1Click
          end
          inline Frametopo1: TFrametopo
            Left = 304
            Top = 64
            Width = 33
            Height = 33
            TabOrder = 4
            inherited mm1: TMainMenu
              Left = 0
              Top = 0
            end
          end
          object Button2: TButton
            Left = 184
            Top = 144
            Width = 121
            Height = 25
            Caption = 'Gerar SQL'
            TabOrder = 7
            OnClick = Button2Click
          end
          object cxDBCheckListBox1: TcxDBCheckListBox
            Left = 320
            Top = 48
            Width = 121
            Height = 121
            Columns = 0
            DataBinding.DataSource = dmgeral.dsclasses
            DataBinding.DataField = 'OPCOES'
            Items = <
              item
                Text = 'Incluir'
              end
              item
                Text = 'Alterar'
              end
              item
                Text = 'Exclur'
              end
              item
                Text = 'Detalhes'
              end
              item
                Text = 'Email'
              end
              item
                Text = 'Editor'
              end
              item
                Text = 'Moeda'
              end
              item
                Text = 'Verificar'
              end
              item
                Text = 'User_id'
              end>
            ParentColor = False
            ReadOnly = False
            ScrollWidth = 0
            TabOrder = 2
            TabWidth = 0
          end
        end
        object grpcampos: TGroupBox
          Left = 1
          Top = 178
          Width = 463
          Height = 360
          Align = alClient
          Caption = 'Campos'
          TabOrder = 1
          DesignSize = (
            463
            360)
          object Label1: TLabel
            Left = 8
            Top = 80
            Width = 33
            Height = 13
            Caption = 'Campo'
          end
          object Label2: TLabel
            Left = 168
            Top = 80
            Width = 34
            Height = 13
            Caption = 'Padr'#227'o'
          end
          object Label3: TLabel
            Left = 296
            Top = 80
            Width = 21
            Height = 13
            Caption = 'Tipo'
          end
          object Label6: TLabel
            Left = 312
            Top = 40
            Width = 45
            Height = 13
            Caption = 'Tamanho'
          end
          object Label7: TLabel
            Left = 360
            Top = 40
            Width = 33
            Height = 13
            Caption = 'Minimo'
          end
          object Label11: TLabel
            Left = 270
            Top = 19
            Width = 23
            Height = 13
            Caption = 'Igual'
          end
          object lbdecimal: TLabel
            Left = 400
            Top = 40
            Width = 38
            Height = 13
            Caption = 'Decimal'
          end
          object DBGrid1: TDBGrid
            Left = 8
            Top = 128
            Width = 447
            Height = 224
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataSource = dmgeral.dscampos
            TabOrder = 12
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'CAMPO'
                Title.Caption = 'Campo'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIPO'
                Title.Caption = 'Tipo'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CHAVE'
                Title.Caption = 'Chave'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PADRAO'
                Title.Caption = 'Padr'#227'o'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TAMANHO'
                Title.Caption = 'Tamanho'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MINIMO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'OBRIGATORIO'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LISTAR'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UNICO'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CDEC'
                Visible = True
              end>
          end
          object DBNavigator2: TDBNavigator
            Left = 8
            Top = 16
            Width = 240
            Height = 25
            DataSource = dmgeral.dscampos
            TabOrder = 0
          end
          object edcampo: TDBEdit
            Left = 8
            Top = 96
            Width = 153
            Height = 21
            DataField = 'CAMPO'
            DataSource = dmgeral.dscampos
            TabOrder = 9
          end
          object edpadrao: TDBEdit
            Left = 168
            Top = 96
            Width = 121
            Height = 21
            DataField = 'PADRAO'
            DataSource = dmgeral.dscampos
            TabOrder = 10
          end
          object ckchave: TDBCheckBox
            Left = 8
            Top = 56
            Width = 97
            Height = 17
            Caption = 'Chave Primaria'
            DataField = 'CHAVE'
            DataSource = dmgeral.dscampos
            TabOrder = 2
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object setipo: TDBComboBox
            Left = 296
            Top = 96
            Width = 145
            Height = 19
            Style = csOwnerDrawVariable
            DataField = 'TIPO'
            DataSource = dmgeral.dscampos
            ItemHeight = 13
            Items.Strings = (
              'String'
              'Texto'
              'Radio'
              'Select'
              'Hidden'
              'File'
              'Arquivo'
              'Numero'
              'Decimal'
              'Data'
              'Boolean'
              'Email'
              'Imagem'
              'Confirmacao')
            TabOrder = 11
          end
          object dbedtTAMANHO: TDBEdit
            Left = 312
            Top = 56
            Width = 41
            Height = 21
            DataField = 'TAMANHO'
            DataSource = dmgeral.dscampos
            TabOrder = 6
          end
          object DBEdit1: TDBEdit
            Left = 360
            Top = 56
            Width = 41
            Height = 21
            DataField = 'MINIMO'
            DataSource = dmgeral.dscampos
            TabOrder = 7
          end
          object DBCheckBox1: TDBCheckBox
            Left = 104
            Top = 56
            Width = 97
            Height = 17
            Caption = 'Obrigatorio'
            DataField = 'OBRIGATORIO'
            DataSource = dmgeral.dscampos
            TabOrder = 3
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object cklist: TDBCheckBox
            Left = 184
            Top = 56
            Width = 97
            Height = 17
            Caption = 'Listar'
            DataField = 'LISTAR'
            DataSource = dmgeral.dscampos
            TabOrder = 4
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBCheckBox2: TDBCheckBox
            Left = 240
            Top = 56
            Width = 65
            Height = 17
            Caption = 'Unico'
            DataField = 'UNICO'
            DataSource = dmgeral.dscampos
            TabOrder = 5
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBEdit6: TDBEdit
            Left = 304
            Top = 16
            Width = 121
            Height = 21
            DataSource = dmgeral.dscampos
            TabOrder = 1
          end
          object dbdec: TDBEdit
            Left = 408
            Top = 56
            Width = 25
            Height = 21
            DataField = 'CDEC'
            DataSource = dmgeral.dscampos
            TabOrder = 8
          end
        end
      end
    end
    object ts9: TTabSheet
      Caption = 'Base de conhecimento'
      ImageIndex = 1
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 876
        Height = 313
        Align = alTop
        Caption = 'Classes'
        TabOrder = 0
        DesignSize = (
          876
          313)
        object Label9: TLabel
          Left = 742
          Top = 104
          Width = 48
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Descri'#231#227'o'
        end
        object Label10: TLabel
          Left = 742
          Top = 144
          Width = 45
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Categoria'
        end
        object lbl4: TLabel
          Left = 743
          Top = 185
          Width = 32
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Lingua'
        end
        object Label13: TLabel
          Left = 742
          Top = 224
          Width = 27
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Pasta'
        end
        object DBGrid3: TDBGrid
          Left = 8
          Top = 104
          Width = 727
          Height = 201
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataSource = dmgeral.dscodes1
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Width = 28
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Width = 168
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CATEGORIA'
              Width = 76
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LINGUA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GRAVAR'
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PASTA'
              Width = 64
              Visible = True
            end>
        end
        object DBNavigator3: TDBNavigator
          Left = 10
          Top = 78
          Width = 711
          Height = 25
          DataSource = dmgeral.dscodes1
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbCancel, nbRefresh]
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
        object DBEdit2: TDBEdit
          Left = 742
          Top = 120
          Width = 121
          Height = 21
          Anchors = [akTop, akRight]
          DataField = 'DESCRICAO'
          DataSource = dmgeral.dscodes1
          TabOrder = 3
        end
        object DBEdit5: TDBEdit
          Left = 742
          Top = 160
          Width = 121
          Height = 21
          Anchors = [akTop, akRight]
          DataField = 'CATEGORIA'
          DataSource = dmgeral.dscodes1
          TabOrder = 4
        end
        object btn2: TButton
          Left = 742
          Top = 280
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Salvar'
          TabOrder = 8
          OnClick = btn2Click
        end
        object dbcbb1: TDBComboBox
          Left = 742
          Top = 200
          Width = 121
          Height = 21
          Anchors = [akTop, akRight]
          DataField = 'LINGUA'
          DataSource = dmgeral.dscodes1
          ItemHeight = 13
          TabOrder = 5
        end
        object grp1: TGroupBox
          Left = 8
          Top = 15
          Width = 851
          Height = 61
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Filtro'
          TabOrder = 0
          DesignSize = (
            851
            61)
          object lbl5: TLabel
            Left = 7
            Top = 14
            Width = 32
            Height = 13
            Caption = 'Lingua'
          end
          object lbl6: TLabel
            Left = 160
            Top = 16
            Width = 43
            Height = 13
            Caption = 'Pesquisa'
          end
          object cbb1: TComboBox
            Left = 8
            Top = 32
            Width = 145
            Height = 21
            ItemHeight = 0
            TabOrder = 0
            OnChange = cbb1Change
          end
          object edpesq: TEdit
            Left = 160
            Top = 32
            Width = 675
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            OnChange = cbb1Change
          end
        end
        object dbchk1: TDBCheckBox
          Left = 744
          Top = 264
          Width = 97
          Height = 17
          Caption = 'Gravar'
          DataField = 'GRAVAR'
          DataSource = dmgeral.dscodes1
          TabOrder = 7
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBEdit7: TDBEdit
          Left = 742
          Top = 240
          Width = 121
          Height = 21
          Anchors = [akTop, akRight]
          DataField = 'PASTA'
          DataSource = dmgeral.dscodes1
          TabOrder = 6
        end
      end
      object syncode: TSynEdit
        Left = 0
        Top = 313
        Width = 876
        Height = 226
        Align = alClient
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        TabOrder = 1
        Gutter.Font.Charset = DEFAULT_CHARSET
        Gutter.Font.Color = clWindowText
        Gutter.Font.Height = -11
        Gutter.Font.Name = 'Courier New'
        Gutter.Font.Style = []
        Gutter.ShowLineNumbers = True
      end
    end
  end
  object SynPHPSyn1: TSynPHPSyn
    CommentAttri.Foreground = clMenuHighlight
    KeyAttri.Foreground = clNavy
    NumberAttri.Foreground = clGreen
    StringAttri.Foreground = clMaroon
    SymbolAttri.Foreground = clNavy
    VariableAttri.Foreground = clRed
    Left = 508
    Top = 360
  end
  object SynMultiSyn1: TSynMultiSyn
    Schemes = <
      item
        StartExpr = #39'<?'#39
        EndExpr = #39'?>'#39
        Highlighter = SynPHPSyn1
      end
      item
        StartExpr = #39'-- '#39
        Highlighter = SynSQLSyn1
      end
      item
        StartExpr = #39'<%'#39
        EndExpr = #39'%>'#39
        Highlighter = SynCSSyn1
      end
      item
        StartExpr = #39'<'#39
        EndExpr = #39'>'#39
        Highlighter = SynHTMLSyn1
      end
      item
        StartExpr = #39'}'#39
        EndExpr = #39'{'#39
        Highlighter = SynJavaSyn1
      end
      item
        StartExpr = 'css'
        Highlighter = SynCssSyn1
      end
      item
        StartExpr = 'begin'
        EndExpr = 'end'
        Highlighter = SynPasSyn1
      end
      item
        StartExpr = 'script'
        Highlighter = SynJScriptSyn1
      end>
    DefaultHighlighter = SynPHPSyn1
    Left = 188
    Top = 440
  end
  object SynJScriptSyn1: TSynJScriptSyn
    IdentifierAttri.Foreground = clMaroon
    KeyAttri.Foreground = clGreen
    EventAttri.Foreground = clNavy
    StringAttri.Foreground = clBlue
    SymbolAttri.Foreground = clMaroon
    Left = 580
    Top = 360
  end
  object SynSQLSyn1: TSynSQLSyn
    Left = 617
    Top = 363
  end
  object SynPasSyn1: TSynPasSyn
    CommentAttri.Foreground = clGray
    IdentifierAttri.Foreground = clNavy
    KeyAttri.Foreground = clBlack
    NumberAttri.Foreground = clGreen
    FloatAttri.Foreground = clFuchsia
    HexAttri.Foreground = clOlive
    StringAttri.Foreground = clBlue
    SymbolAttri.Foreground = clRed
    Left = 404
    Top = 355
  end
  object SynHTMLSyn1: TSynHTMLSyn
    Left = 356
    Top = 355
  end
  object SynCssSyn1: TSynCssSyn
    CommentAttri.Foreground = clTeal
    PropertyAttri.Foreground = clNavy
    NumberAttri.Foreground = clMaroon
    KeyAttri.Foreground = clBlue
    StringAttri.Foreground = clRed
    SymbolAttri.Foreground = clMaroon
    Left = 444
    Top = 355
  end
  object SynCSSyn1: TSynCSSyn
    Left = 308
    Top = 347
  end
  object SynCobolSyn1: TSynCobolSyn
    AreaAStartPos = 7
    AreaBStartPos = 11
    CodeEndPos = 71
    Left = 252
    Top = 339
  end
  object SynJavaSyn1: TSynJavaSyn
    Left = 204
    Top = 339
  end
  object SynCppSyn1: TSynCppSyn
    Left = 172
    Top = 339
  end
  object OpenDialog1: TOpenDialog
    Left = 737
    Top = 315
  end
end
