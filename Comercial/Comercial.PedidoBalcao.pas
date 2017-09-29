unit Comercial.PedidoBalcao;

interface

uses
  System.Actions, System.UITypes,System.Variants,
  forms, Windows, dialogs, graphics, Mask, Buttons, Controls, ToolWin, ExtCtrls, types,
  sysutils, StdCtrls, ComCtrls, Spin, Classes, ActnList, Menus,

  dialogo.exportarexcel, rotina.registro, uconstantes, rotina.AdicionarListView,
  localizar.produto, localizar.Cliente,

  classe.form, orm.produto,

  cxLookAndFeelPainters, cxControls, cxContainer, cxEdit, cxGroupBox, cxButtons,
  dxBar, cxClasses, cxGraphics, cxLookAndFeels, cxLabel, cxPC, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxDBData, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxSpinEdit, cxDBEdit, cxMaskEdit, cxCalendar, cxTextEdit,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxTimeEdit, cxButtonEdit, cxCalc, cxCurrencyEdit, cxPCdxBarPopupMenu,
  cxCheckBox, cxNavigator, dxBarBuiltInMenu, cxDBLabel, cxMemo,
  cxGridBandedTableView, cxGridDBBandedTableView, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmPedidoBalcao = class(TForm)
    act: TActionList;
    actNovo: TAction;
    actAbrir: TAction;
    actSalvar: TAction;
    actImprimir: TAction;
    actExcluir: TAction;
    actCancelar: TAction;
    actEditar: TAction;
    actPrimeiro: TAction;
    actAnterior: TAction;
    actProximo: TAction;
    actUltimo: TAction;
    actfechar: TAction;
    bmg1: TdxBarManager;
    dxbrManager1Bar: TdxBar;
    dxbrManager1Bar1: TdxBar;
    dxbrsbtmRegistro: TdxBarSubItem;
    dxbrlrgbtnNovo: TdxBarLargeButton;
    dxbrlrgbtnEditar: TdxBarLargeButton;
    dxbrlrgbtnAbrir: TdxBarLargeButton;
    dxbrlrgbtnsalvar: TdxBarLargeButton;
    dxbrlrgbtncancelar: TdxBarLargeButton;
    dxbrlrgbtnexcluir: TdxBarLargeButton;
    dxbrsprtr1: TdxBarSeparator;
    dxbrlrgbtnprimeiro: TdxBarLargeButton;
    dxbrlrgbtnanterior: TdxBarLargeButton;
    dxbrlrgbtnproximo: TdxBarLargeButton;
    dxbrlrgbtnultimo: TdxBarLargeButton;
    dxbrsprtr2: TdxBarSeparator;
    dxbrsprtr3: TdxBarSeparator;
    dxbrlrgbtnfechar: TdxBarLargeButton;
    btnimprimir: TdxBarLargeButton;
    pumimprimir: TdxBarPopupMenu;
    btnopcoes: TdxBarLargeButton;
    actopcoes: TAction;
    pumopcoes: TdxBarPopupMenu;
    pnl: TcxLabel;
    gbxproduto: TGroupBox;
    tbv: TcxGridDBTableView;
    lvl: TcxGridLevel;
    grd: TcxGrid;
    pnl1: TPanel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    mem: TFDMemTable;
    dts: TDataSource;
    edtcddigitado: TcxButtonEdit;
    lblcodigo: TLabel;
    lbl1: TLabel;
    edtqtitem: TcxCalcEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtcdcliente: TcxButtonEdit;
    Label3: TLabel;
    memCDDIGITADO: TStringField;
    memNMPRODUTO: TStringField;
    memQTITEM: TFloatField;
    memVLUNITARIO: TCurrencyField;
    memVLTOTAL: TCurrencyField;
    tbvCDDIGITADO: TcxGridDBColumn;
    tbvNMPRODUTO: TcxGridDBColumn;
    tbvQTITEM: TcxGridDBColumn;
    tbvVLUNITARIO: TcxGridDBColumn;
    tbvVLTOTAL: TcxGridDBColumn;
    edtnmproduto: TEdit;
    edtnmcliente: TEdit;
    memcditpedido: TIntegerField;
    actgerarsaida: TAction;
    dxBarLargeButton1: TdxBarLargeButton;
    memCDPRODUTO: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure colorenter(Sender: TObject);
    procedure colorexit(Sender: TObject);
    procedure nextcontrol(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actfecharExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actImprimirExecute(Sender: TObject);
    procedure exportarGradeExcel(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actopcoesExecute(Sender: TObject);
    procedure eventokeypress(Sender: TObject; var Key: Char);
    procedure actExecute(Action: TBasicAction; var Handled: Boolean);
    procedure edtqtitemKeyPress(Sender: TObject; var Key: Char);
    procedure edtnmprodutoChange(Sender: TObject);
    procedure edtnmprodutoEnter(Sender: TObject);
    procedure edtnmprodutoExit(Sender: TObject);
    procedure edtnmprodutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtcddigitadoPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure edtcddigitadoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtcdclienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtcdclientePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure edtnmclienteChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actgerarsaidaExecute(Sender: TObject);
  private      { Private declarations }
    tbl : string;
    exibe : string;
    cditpedido : integer;
    nusequencia : Integer;
    boteclaback : Boolean;
    procedure ProdutoNaGrade;
    procedure LimparProdutos;
    procedure ExibirProduto;
    procedure TeclaInsert;
    procedure TeclaDelete;
  public  { Public declarations }
    function  Abrir(codigo:Integer):boolean;
  end;

var
  frmPedidoBalcao: TfrmPedidoBalcao;

implementation

uses uDtmMain,
  uMain;

{$R *.DFM}

function TfrmPedidoBalcao.Abrir(codigo:integer):boolean;
begin
end;

procedure TfrmPedidoBalcao.TeclaDelete;
begin
  if mem.RecordCount > 0 then
  begin
    mem.Delete;
    TeclaInsert;
  end;
end;

procedure TfrmPedidoBalcao.FormShow(Sender: TObject);
begin
  pnl.caption := exibe;
  edtcddigitado.SetFocus;
end;

procedure TfrmPedidoBalcao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TfrmPedidoBalcao.actExecute(Action: TBasicAction; var Handled: Boolean);
begin
  dtmmain.LogSiteAction(self.Name, action.Name);
end;

procedure TfrmPedidoBalcao.colorenter(Sender: TObject);
begin
  TcxCustomTextEdit(Sender).Style.Color := _color_enter;
end;

procedure TfrmPedidoBalcao.colorexit(Sender: TObject);
begin
  TcxCustomTextEdit(Sender).Style.Color := _color_exit;
end;

procedure TfrmPedidoBalcao.edtcdclienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = __KeySearch then
  begin
    edtcdclientePropertiesButtonClick(sender, 0)
  end
  else
  begin
    nextcontrol(Sender, Key, shift);
  end;
end;

procedure TfrmPedidoBalcao.edtcdclientePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  codigo : LargeInt;
begin
  codigo := LocalizarCliente;
  if codigo <> 0 then
  begin
    edtcdcliente.Text := codigo.ToString;
    edtnmcliente.Text := qregistro.NomedoCodigo(_cliente, codigo);
  end;
end;

procedure TfrmPedidoBalcao.nextcontrol(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := VK_TAB;
  end;
end;

procedure TfrmPedidoBalcao.actfecharExecute(Sender: TObject);
begin
  close;
  frmmain.main.DestruirBotaoFormAtual(tbl, frmmain.tlbnew);
end;

procedure TfrmPedidoBalcao.actgerarsaidaExecute(Sender: TObject);
begin
//
end;

procedure TfrmPedidoBalcao.FormCreate(Sender: TObject);
begin
  cditpedido := 0;
  nusequencia := 0;
  tbl := _pedido;
  exibe := 'Pedido Balcão';
  mem.Open;
end;

procedure TfrmPedidoBalcao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (shift = [ssCtrl]) and (key = VK_DELETE) then
  begin
    TeclaDelete;
  end;
  if Key = VK_INSERT then
  begin
    TeclaInsert;
  end;
  if key = 40 then
  begin
    mem.Next;
    ExibirProduto;
    key := 0;
  end
  else if key = 38 then
  begin
    mem.Prior;
    ExibirProduto;
    key := 0;
  end;
end;

procedure TfrmPedidoBalcao.actImprimirExecute(Sender: TObject);
begin
  btnimprimir.DropDown(false);
end;

procedure TfrmPedidoBalcao.exportarGradeExcel(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  ExportarExcel(Key, sender);
end;

procedure TfrmPedidoBalcao.actopcoesExecute(Sender: TObject);
begin
  btnopcoes.DropDown(false);
end;

procedure TFrmPedidoBalcao.ProdutoNaGrade;
var
  produto : TProduto;
begin
  if edtqtitem.Value <= 0 then
  begin
    MessageDlg('Quantidade inválida.', mtInformation, [mbOK], 0);
    Abort;
  end;
  produto := tproduto.create;
  try
    if not produto.Select(_nmproduto+'='+quotedstr(edtnmproduto.Text)) then
    begin
      Exit;
    end;
    if cditpedido = 0 then
    begin
      mem.Insert;
      inc(nusequencia);
      mem.FieldByName(_cditpedido).AsInteger  := nusequencia;
    end
    else
    begin
      mem.Locate(_cdproduto, produto.cdproduto, []);
      mem.edit;
    end;
    mem.FieldByName(_cddigitado).AsString   := edtcddigitado.Text;
    mem.FieldByName(_cdproduto).AsInteger   := produto.cdproduto;
    mem.FieldByName(_nmproduto).AsString    := produto.nmproduto;
    mem.FieldByName(_qtitem).AsFloat        := edtqtitem.Value;
    mem.FieldByName(_vlunitario).AsCurrency := produto.vlvenda;
    mem.FieldByName(_vltotal).AsCurrency    := edtqtitem.Value * produto.vlvenda;
    cditpedido := 0;
    mem.Post;
  finally
    FreeAndNil(produto);
  end;
end;

procedure TfrmPedidoBalcao.edtcddigitadoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = __KeySearch then
  begin
    edtcddigitadoPropertiesButtonClick(sender, 0)
  end
  else
  begin
    nextcontrol(Sender, Key, shift);
  end;
end;

procedure TfrmPedidoBalcao.edtcddigitadoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  codigo : Integer;
begin
  codigo := LocalizarProduto;
  if codigo <> 0 then
  begin
    edtcddigitado.Text := codigo.ToString;
    edtnmproduto.Text  := qregistro.NomedoCodigo(_produto, codigo);
  end;
end;

procedure TfrmPedidoBalcao.edtnmclienteChange(Sender: TObject);
var
  codigo : string;
begin
  codigo := preencherNomeListview(TEdit(sender), true);
  if codigo <> '' then
  begin
    edtcdcliente.Text := codigo;
  end;
end;

procedure TfrmPedidoBalcao.edtnmprodutoChange(Sender: TObject);
var
  codigo : string;
begin
  if boteclaback then
  begin
    boteclaback := False;
    Exit;
  end;
  codigo := preencherNomeListview(TEdit(sender), true);
  if codigo <> '' then
  begin
    edtcddigitado.Text := codigo;
  end;
end;

procedure TfrmPedidoBalcao.edtnmprodutoEnter(Sender: TObject);
begin
  TEdit(Sender).Color := _color_enter;
end;

procedure TfrmPedidoBalcao.edtnmprodutoExit(Sender: TObject);
begin
  TEdit(Sender).Color := _color_exit;
end;

procedure TfrmPedidoBalcao.edtnmprodutoKeyDown(Sender: TObject; var Key: Word; shift: TShiftState);
begin
  boteclaback := Key = VK_BACK;
  if Key = VK_RETURN then
  begin
    edtqtitem.SetFocus;
  end;
end;

procedure TfrmPedidoBalcao.edtqtitemKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    ProdutoNaGrade;
    TeclaInsert;
  end;
end;

procedure TfrmPedidoBalcao.TeclaInsert;
begin
  LimparProdutos;
  edtcddigitado.SetFocus;
end;

procedure TfrmPedidoBalcao.LimparProdutos;
begin
  edtcddigitado.Clear;
  edtnmproduto.Clear;
  edtqtitem.Clear;
end;

procedure TfrmPedidoBalcao.eventokeypress(Sender: TObject; var Key: Char);
begin
  QForm.KeyPressControl(key);
end;

procedure TfrmPedidoBalcao.ExibirProduto;
begin
  edtcddigitado.Text := mem.FieldByName(_cddigitado).AsString;
  edtnmproduto.Text  := mem.FieldByName(_nmproduto).AsString;
  edtqtitem.Value    := mem.FieldByName(_qtitem).AsFloat;
  cditpedido         := mem.FieldByName(_cditpedido).AsInteger;
end;

end.
