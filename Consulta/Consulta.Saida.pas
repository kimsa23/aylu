unit Consulta.Saida;

interface

uses
  System.Actions, System.UITypes,
  forms, windows, Buttons, Controls, Mask, ExtCtrls, ToolWin, sysutils, Classes,
  dialogs, ComCtrls, ActnList, StdCtrls,
  DB,
  rotina.strings, rotina.datahora, uconstantes, rotina.registro, rotina.AdicionarListView,
  rotina.system,
  orm.saida, orm.empresa, classe.form, classe.InstrucaoSQL,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxPCdxBarPopupMenu,
  cxContainer, cxEdit, dxBar, cxClasses, cxLabel, cxSplitter, cxCalc, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxGroupBox, cxRadioGroup, cxCheckBox,
  cxListView, cxPC, dxCore, cxDateUtils, dxBarBuiltInMenu;

type
  TfrmConsultaSaida = class(TForm)
    ActionList1: TActionList;
    actGerar: TAction;
    ntb: TNotebook;
    actsalvar: TAction;
    mem: TRichEdit;
    actfechar: TAction;
    bmg1: TdxBarManager;
    dxbrManager1Bar: TdxBar;
    dxbrlrgbtnsalvar: TdxBarLargeButton;
    dxbrlrgbtnfechar: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    spl1: TcxSplitter;
    pnl1: TPanel;
    pgc: TcxPageControl;
    tbscliente: TcxTabSheet;
    Bevel2: TBevel;
    lblnmcliente: TLabel;
    lblcdcliente: TLabel;
    edtcdcliente: TEdit;
    edtnmcliente: TEdit;
    ToolBar3: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton8: TToolButton;
    lsvcliente: TcxListView;
    tbsrepresentante: TcxTabSheet;
    Label6: TLabel;
    Label5: TLabel;
    Bevel4: TBevel;
    edtcdrepresentante: TEdit;
    edtnmrepresentante: TEdit;
    ToolBar7: TToolBar;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    ToolButton24: TToolButton;
    lsvrepresentante: TcxListView;
    tbsuf: TcxTabSheet;
    Bevel3: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    edtnmuf: TEdit;
    edtcduf: TEdit;
    ToolBar4: TToolBar;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    lsvuf: TcxListView;
    tbsproduto: TcxTabSheet;
    Bevel7: TBevel;
    Label9: TLabel;
    Label10: TLabel;
    ToolBar5: TToolBar;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton20: TToolButton;
    edtnmproduto: TEdit;
    edtcdproduto: TEdit;
    lsvproduto: TcxListView;
    tbstpsaida: TcxTabSheet;
    Bevel8: TBevel;
    Label11: TLabel;
    Label12: TLabel;
    ToolBar6: TToolBar;
    ToolButton28: TToolButton;
    ToolButton29: TToolButton;
    ToolButton31: TToolButton;
    edtnmtpsaida: TEdit;
    edtcdtpsaida: TEdit;
    lsvtpsaida: TcxListView;
    tbsgrupo: TcxTabSheet;
    Bevel9: TBevel;
    Label14: TLabel;
    Label13: TLabel;
    ToolBar9: TToolBar;
    ToolButton32: TToolButton;
    ToolButton33: TToolButton;
    ToolButton35: TToolButton;
    edtcdgrupo: TEdit;
    edtnmgrupo: TEdit;
    lsvgrupo: TcxListView;
    tbsrota: TcxTabSheet;
    Bevel10: TBevel;
    Label16: TLabel;
    Label15: TLabel;
    edtcdrota: TEdit;
    edtnmrota: TEdit;
    ToolBar10: TToolBar;
    ToolButton36: TToolButton;
    ToolButton37: TToolButton;
    ToolButton39: TToolButton;
    lsvrota: TcxListView;
    tbsfornecedor: TcxTabSheet;
    Bevel11: TBevel;
    Label17: TLabel;
    lblcdfornecedor: TLabel;
    edtcdfornecedor: TEdit;
    edtnmfornecedor: TEdit;
    ToolBar11: TToolBar;
    ToolButton40: TToolButton;
    ToolButton41: TToolButton;
    ToolButton43: TToolButton;
    lsvfornecedor: TcxListView;
    lblinicial: TLabel;
    lblfinal: TLabel;
    lblpeso: TLabel;
    edtdtf: TcxDateEdit;
    edtdti: TcxDateEdit;
    edtpesof: TcxCalcEdit;
    edtpesoi: TcxCalcEdit;
    Bevel1: TBevel;
    ckbprodutoinversa: TcxCheckBox;
    ckbprodutoacabado: TcxCheckBox;
    trv: TTreeView;
    Panel1: TPanel;
    pnl: TcxLabel;
    ckbnrecebido: TcxCheckBox;
    tbscondpagto: TcxTabSheet;
    ToolBar8: TToolBar;
    ToolButton3: TToolButton;
    ToolButton6: TToolButton;
    ToolButton11: TToolButton;
    Label18: TLabel;
    Label19: TLabel;
    edtcdcondpagto: TEdit;
    edtnmcondpagto: TEdit;
    lsvcondpagto: TcxListView;
    Bevel12: TBevel;
    tbstpcobranca: TcxTabSheet;
    ToolBar12: TToolBar;
    ToolButton15: TToolButton;
    ToolButton19: TToolButton;
    ToolButton23: TToolButton;
    Bevel13: TBevel;
    edtnmtpcobranca: TEdit;
    edtcdtpcobranca: TEdit;
    Label20: TLabel;
    Label21: TLabel;
    lsvtpcobranca: TcxListView;
    tbsmunicipio: TcxTabSheet;
    ToolBar1: TToolBar;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton38: TToolButton;
    Bevel5: TBevel;
    edtnmmunicipio: TEdit;
    edtcdmunicipio: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    lsvmunicipio: TcxListView;
    tbscfop: TcxTabSheet;
    ToolBar2: TToolBar;
    ToolButton7: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    Label7: TLabel;
    edtcdcfop: TEdit;
    edtnmcfop: TEdit;
    Label8: TLabel;
    Bevel6: TBevel;
    lsvcfop: TcxListView;
    tbsstdocumento: TcxTabSheet;
    edtnmstdocumento: TEdit;
    edtnustdocumento: TEdit;
    Label22: TLabel;
    Label23: TLabel;
    ToolBar13: TToolBar;
    ToolButton16: TToolButton;
    ToolButton25: TToolButton;
    ToolButton26: TToolButton;
    lsvstdocumento: TcxListView;
    Bevel14: TBevel;
    tbsserie: TcxTabSheet;
    ToolBar14: TToolBar;
    ToolButton27: TToolButton;
    ToolButton30: TToolButton;
    ToolButton34: TToolButton;
    Label24: TLabel;
    Label25: TLabel;
    edtnmserie: TEdit;
    edtcdserie: TEdit;
    Bevel15: TBevel;
    lsvserie: TcxListView;
    procedure FormShow(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure ToolButton21Click(Sender: TObject);
    procedure ToolButton22Click(Sender: TObject);
    procedure ToolButton24Click(Sender: TObject);
    procedure actGerarExecute(Sender: TObject);
    procedure trvChange(Sender: TObject; Node: TTreeNode);
    procedure actsalvarExecute(Sender: TObject);
    procedure edtnmufChange(Sender: TObject);
    procedure edtnmufKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtnmrepresentanteChange(Sender: TObject);
    procedure edtnmrepresentanteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtnmclienteChange(Sender: TObject);
    procedure edtnmclienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ToolButton17Click(Sender: TObject);
    procedure ToolButton28Click(Sender: TObject);
    procedure ToolButton18Click(Sender: TObject);
    procedure ToolButton29Click(Sender: TObject);
    procedure ToolButton20Click(Sender: TObject);
    procedure ToolButton31Click(Sender: TObject);
    procedure edtnmprodutoChange(Sender: TObject);
    procedure edtnmtpsaidaChange(Sender: TObject);
    procedure edtnmprodutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtnmtpsaidaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtcdrepresentanteKeyPress(Sender: TObject; var Key: Char);
    procedure edtcdufKeyPress(Sender: TObject; var Key: Char);
    procedure edtcdprodutoKeyPress(Sender: TObject; var Key: Char);
    procedure edtcdtpsaidaKeyPress(Sender: TObject; var Key: Char);
    procedure ToolButton32Click(Sender: TObject);
    procedure ToolButton33Click(Sender: TObject);
    procedure ToolButton35Click(Sender: TObject);
    procedure edtcdgrupoKeyPress(Sender: TObject; var Key: Char);
    procedure edtnmgrupoChange(Sender: TObject);
    procedure edtnmgrupoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ToolButton36Click(Sender: TObject);
    procedure ToolButton37Click(Sender: TObject);
    procedure ToolButton39Click(Sender: TObject);
    procedure edtcdrotaKeyPress(Sender: TObject; var Key: Char);
    procedure edtnmrotaChange(Sender: TObject);
    procedure edtnmrotaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ToolButton40Click(Sender: TObject);
    procedure ToolButton41Click(Sender: TObject);
    procedure ToolButton43Click(Sender: TObject);
    procedure edtnmfornecedorChange(Sender: TObject);
    procedure edtnmfornecedorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actfecharExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ntbPageChanged(Sender: TObject);
    procedure edtcdclienteKeyPress(Sender: TObject; var Key: Char);
    procedure edtcdfornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure edtcdcondpagtoKeyPress(Sender: TObject; var Key: Char);
    procedure edtnmcondpagtoChange(Sender: TObject);
    procedure edtnmcondpagtoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton15Click(Sender: TObject);
    procedure ToolButton19Click(Sender: TObject);
    procedure ToolButton23Click(Sender: TObject);
    procedure edtcdtpcobrancaKeyPress(Sender: TObject; var Key: Char);
    procedure edtnmtpcobrancaChange(Sender: TObject);
    procedure edtnmtpcobrancaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton38Click(Sender: TObject);
    procedure edtcdmunicipioKeyPress(Sender: TObject; var Key: Char);
    procedure edtnmmunicipioChange(Sender: TObject);
    procedure edtnmmunicipioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure ToolButton14Click(Sender: TObject);
    procedure edtcdcfopKeyPress(Sender: TObject; var Key: Char);
    procedure edtnmcfopChange(Sender: TObject);
    procedure edtnmcfopKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ToolButton16Click(Sender: TObject);
    procedure ToolButton25Click(Sender: TObject);
    procedure ToolButton26Click(Sender: TObject);
    procedure edtnustdocumentoKeyPress(Sender: TObject; var Key: Char);
    procedure edtnmstdocumentoChange(Sender: TObject);
    procedure edtnmstdocumentoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ToolButton27Click(Sender: TObject);
    procedure ToolButton30Click(Sender: TObject);
    procedure ToolButton34Click(Sender: TObject);
    procedure edtnmserieChange(Sender: TObject);
    procedure edtnmserieKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtcdserieKeyPress(Sender: TObject; var Key: Char);
  private    { Private declarations }
    saida : TSaida;
    bloco : TInstrucaoSQL;
    executar_on_change_serie, executar_on_change_municipio, executar_on_change_uf : boolean;
    executar_on_change_tpcobranca    : boolean;
    executar_on_change_cfop    : boolean;
    executar_on_change_stdocumento, executar_on_change_representante : boolean;
    executar_on_change_cliente       : boolean;
    executar_on_change_produto       : boolean;
    executar_on_change_grupo         : boolean;
    executar_on_change_tpsaida       : boolean;
    executar_on_change_Rota          : boolean;
    executar_on_change_Fornecedor    : boolean;
    executar_on_change_condpagto     : Boolean;
    procedure AplicarConfiguracaoEmpresa;
    procedure ConfiguracaoEmpresa;
    procedure set_treeview;
    function getreport(tp: integer; nmconsulta: string): boolean;
    procedure treeview_deletar(tp: integer);
  public    { Public declarations }
  end;

var
  frmConsultaSaida: TfrmConsultaSaida;

implementation

uses uMain,
  dialogo.ProgressBar,
  impressao.relatoriopadrao,
  Impressao.SaidaReferenciaCruzada,
  //uconsultasaidaImprimirPrecoMedioVendaProduto,
  //uconsultasaidaImprimirPrecoMedioVendaProduto071218,
  //uconsultasaidaImprimirSinteticoFretePorCidade,
  //uconsultasaidaImprimirDebitoICMS,
  //uconsultasaidaImprimirDebitoICMSSUBTRIB,
  //uconsultasaidaImprimirDebitoIPI,
  //uconsultasaidaImprimirDiarioFrete,
  //uconsultasaidaImprimirDiarioICMS,
  //uconsultasaidaImprimirDiarioProdutos,
  //uconsultasaidaImprimirICMSBCPorEstado,
  //uconsultasaidaImprimirICMSFretePorEstado,
  //uconsultasaidaImprimirImposto,
  //uconsultasaidaImprimirMensalfrete,
  //uconsultasaidaImprimirMensalICMS,
  //uconsultasaidaImprimirMensalPorEstado,
  //uconsultasaidaImprimirMensalQuebraTpSaida,
  //uconsultasaidaImprimirPorEstado,
  //uconsultasaidaImprimirSinteticoFrete,
  //uconsultasaidaImprimirSinteticoFretePorcentagem,
  //uconsultasaidaImprimirSinteticoICMS,
  rotina.montarsql,
  impressao.estoquecompleto, uDtmMain;

{$R *.dfm}

function TFrmConsultaSaida.getreport(tp:integer; nmconsulta:string):boolean;
begin
  result := false;
  if tp = 2 then
  begin
    result := nmconsulta = '364 - Aproveitamento Cr�dito PIS e COFINS'
  end
  else if tp = 3 then
  begin
    result := (nmconsulta = '363 - Apura��o de PIS e COFINS') or
              //(nmconsulta = 'D�bito ICMS') or
              //(nmconsulta = 'D�bito IPI') or
              //(nmconsulta = 'Di�rio ICMS') or
              //(nmconsulta = 'ICMS/Frete por Estado Mensal') or
              //(nmconsulta = 'ICMS por Estado Mensal') or
              //(nmconsulta = 'Mensal ICMS') or
              //(nmconsulta = 'Pre�o M�dio Venda Produto (ICMS 07%/12%/18%)') or
              //(nmconsulta = 'Sint�tico ICMS') or
              (nmconsulta = '348 - Sint�tico PIS e COFINS') or
              (nmconsulta = 'Valor do ICMS Mensal (por Uf)') or
              (nmconsulta = 'Valor do IPI  Mensal (por Uf)') or
              (nmconsulta = 'Valor da base ICMS Mensal (por Uf)') or
              (nmconsulta = 'Valor da base IPI Mensal (por Uf)');
  end
  else if tp = 4 then
  begin
    //result := nmconsulta = 'D�bito ICMS Substitui��o Tribut�ria';
  end
  else if tp = 5 then
  begin
    result := (nmconsulta = '617 - Quantidade Vendida Mensal (por Representante)') or
              (nmconsulta = 'Valor Vendido Mensal (por Representante)') or
              (nmconsulta = 'Valor de Comissao Mensal (por Uf)') or
              (nmconsulta = 'Valor de Comissao Mensal (por Representante)') or
              (nmconsulta = 'Recalcular Comiss�o');
  end;
end;

procedure TFrmConsultaSaida.treeview_deletar(tp:integer);
var
  no : TTreeNode;
  i : integer;
begin
  for I := 0 to trv.Items.Count - 1 do
  begin
    if getreport(tp, trv.Items[i].Text) then
    begin
      no := trv.Items[i];
      trv.Items.Delete(no);
      treeview_deletar(tp);
      break;
    end;
  end;
end;

procedure TFrmConsultaSaida.AplicarConfiguracaoEmpresa;
begin
  if empresa.tpregime <> _r then
  begin
    treeview_deletar(2);
  end;
  if empresa.tpregime = _s then
  begin
    treeview_deletar(3);
  end;
  if not empresa.bosubstituto then
  begin
    treeview_deletar(4);
  end;
  if tbsrepresentante.TabVisible then
  begin
    tbsrepresentante.TabVisible := empresa.comercial.representante.bo;
  end;
  if not empresa.comercial.representante.bo then
  begin
    treeview_deletar(5);
  end;
  tbsrota.tabvisible := false;
end;

procedure TFrmConsultaSaida.ConfiguracaoEmpresa;
begin
  aplicarConfiguracaoEmpresa;
end;

procedure TfrmConsultaSaida.FormShow(Sender: TObject);
begin
  saida       := TSaida.Create;
  configuracaoempresa;
  ntb.ActivePage := 'Default';
  edtdtf.date    := dtbanco;
  edtdti.date    := dtbanco;
  trv.Items[0].Expand(true);
end;

procedure TfrmConsultaSaida.ToolButton1Click(Sender: TObject);
begin
  AdicionarListview(lsvcliente)
end;

procedure TfrmConsultaSaida.ToolButton9Click(Sender: TObject);
begin
  AdicionarListView(lsvuf);
end;

procedure TfrmConsultaSaida.ToolButton21Click(Sender: TObject);
begin
  AdicionarListView(lsvrepresentante);
end;

procedure TfrmConsultaSaida.ToolButton2Click(Sender: TObject);
begin
  ExcluirListView(lsvcliente);
end;

procedure TfrmConsultaSaida.ToolButton10Click(Sender: TObject);
begin
  ExcluirListView(lsvuf);
end;

procedure TfrmConsultaSaida.ToolButton22Click(Sender: TObject);
begin
  ExcluirListView(lsvrepresentante);
end;

procedure TfrmConsultaSaida.ToolButton8Click(Sender: TObject);
begin
  lsvCliente.Clear;
end;

procedure TfrmConsultaSaida.ToolButton12Click(Sender: TObject);
begin
  lsvuf.Clear;
end;

procedure TfrmConsultaSaida.ToolButton24Click(Sender: TObject);
begin
  lsvrepresentante.Clear;
end;

procedure TfrmConsultaSaida.actGerarExecute(Sender: TObject);
var
  nopai, consulta, acabado :string;
  nustdocumento, sqlwhere, cdtpcobranca, cdcondpagto, cdrota, cdgrupo, cdproduto, cdtpsaida, cdrepresentante, cduf, cdmunicipio, cdcliente : TStrings;
  cdcfop, cdserie, cdcntcusto, cdtpcliente, cdstordserv, cdetapa, linhas, cdfornecedor : TStrings;
  dti, dtf : TDate;
  boprodutoinversa : boolean;
  function makesqlwherepiscofins:string;
  begin
    result := 'where saida.cdempresa='+empresa.cdempresa.tostring+' and saida.dtemissao between '+getdtbanco(dti)+' and '+getdtbanco(dtf)+' ';
    sqlmontarlista(cdcliente      , _saida, _cdcliente      , result);
    sqlmontarlista(cdtpsaida      , _saida, _cdtpsaida      , result);
    sqlmontarlista(nustdocumento  , _saida, _nustdocumento  , result);
    sqlmontarlista(cdrepresentante, _saida, _cdrepresentante, result);
  end;
  function makesqlaproveitamentocreditopiscofins:string;
  begin
    result := 'where saida.cdempresa='+empresa.cdempresa.tostring+' and saida.cdsaida in (select cdsaida from duplicata where dtbaixa between '+getdtbanco(dti)+' and '+getdtbanco(dtf)+' group by cdsaida) ';
    sqlmontarlista(cdcliente      , _saida, _cdcliente      , result);
    sqlmontarlista(cdtpsaida      , _saida, _cdtpsaida      , result);
    sqlmontarlista(nustdocumento  , _saida, _nustdocumento  , result);
    sqlmontarlista(cdrepresentante, _saida, _cdrepresentante, result);
  end;
  function makesqlanalitico:string;
  begin
    result := 'where s.cdempresa='+empresa.cdempresa.tostring+' and s.dtemissao between '+getdtbanco(dti)+' and '+getdtbanco(dtf)+' ';
    sqlmontarlista(cdrepresentante, _s, _cdrepresentante, result);
    sqlmontarlista(cdcondpagto    , _s, _cdcondpagto    , result);
    sqlmontarlista(cdcliente      , _s, _cdcliente      , result);
    sqlmontarlista(cdproduto      , _i, _cdproduto      , result);
    sqlmontarlista(cdtpsaida      , _s, _cdtpsaida      , result);
    sqlmontarlista(nustdocumento  , _s, _nustdocumento  , result);
    sqlmontarlista(cdrota         , _s, _cdrota         , result);
  end;
  function makesqlsintetico:string;
  begin
    result := 'where saida.cdempresa='+empresa.cdempresa.tostring+' and saida.dtemissao between '+getdtbanco(dti)+' and '+getdtbanco(dtf)+' ';
    sqlmontarlista(cdcliente      , _saida  , _cdcliente      , result);
    sqlmontarlista(cdtpsaida      , _saida  , _cdtpsaida      , result);
    sqlmontarlista(nustdocumento  , _saida  , _nustdocumento  , result);
    sqlmontarlista(cdcondpagto    , _saida  , _cdcondpagto    , result);
    sqlmontarlista(cduf           , _cliente, _cduf           , result);
    sqlmontarlista(cdfornecedor   , _saida  , _cdfornecedor   , result);
    sqlmontarlista(cdrota         , _saida  , _cdrota         , result);
    sqlmontarlista(cdrepresentante, _saida  , _cdrepresentante, result);
    sqlmontarlista(cdproduto      , _itsaida, _cdproduto      , result, 0, boprodutoinversa);
  end;
  function makesqlsinteticoiss:string;
  begin
    result := 'and saida.cdempresa='+empresa.cdempresa.tostring+' and saida.dtemissao between '+getdtbanco(dti)+' and '+getdtbanco(dtf)+' ';
    sqlmontarlista(cdcliente      , _saida  , _cdcliente      , result);
    sqlmontarlista(cdtpsaida      , _saida  , _cdtpsaida      , result);
    sqlmontarlista(nustdocumento  , _saida  , _nustdocumento  , result);
    sqlmontarlista(cdcondpagto    , _saida  , _cdcondpagto    , result);
    sqlmontarlista(cduf           , _cliente, _cduf           , result);
    sqlmontarlista(cdfornecedor   , _saida  , _cdfornecedor   , result);
    sqlmontarlista(cdrepresentante, _saida  , _cdrepresentante, result);
  end;
  function makesqlgerencial:string;
  begin
    result := 'where saida.cdempresa='+empresa.cdempresa.tostring+' and saida.dtemissao between '+getdtbanco(dti)+' and '+getdtbanco(dtf)+' ';
    sqlmontarlista(cdcliente      , _saida  , _cdcliente      , result);
    sqlmontarlista(cdtpsaida      , _saida  , _cdtpsaida      , result);
    sqlmontarlista(nustdocumento  , _saida, _nustdocumento  , result);
    sqlmontarlista(cdcondpagto    , _saida  , _cdcondpagto    , result);
    sqlmontarlista(cduf           , _cliente, _cduf           , result);
    sqlmontarlista(cdfornecedor   , _saida  , _cdfornecedor   , result);
    sqlmontarlista(cdrota         , _saida  , _cdrota         , result);
    sqlmontarlista(cdrepresentante, _saida  , _cdrepresentante, result);
  end;
  function makesqlsinteticocondpagto:string;
  begin
    result := 'where saida.cdempresa='+empresa.cdempresa.tostring+' and saida.dtemissao between '+getdtbanco(dti)+' and '+getdtbanco(dtf)+' ';
    sqlmontarlista(cdcliente      , _saida  , _cdcliente      , result);
    sqlmontarlista(cdtpsaida      , _saida  , _cdtpsaida      , result);
    sqlmontarlista(nustdocumento  , _saida, _nustdocumento  , result);
    sqlmontarlista(cdtpcobranca   , _saida  , _cdtpcobranca   , result);
    sqlmontarlista(cdcondpagto    , _saida  , _cdcondpagto    , result);
    sqlmontarlista(cduf           , _cliente, _cduf           , result);
    sqlmontarlista(cdfornecedor   , _saida  , _cdfornecedor   , result);
    sqlmontarlista(cdrota         , _saida  , _cdrota         , result);
    sqlmontarlista(cdrepresentante, _saida  , _cdrepresentante, result);
    sqlmontarlista(cdproduto      , _itsaida, _cdproduto      , result, 0, boprodutoinversa);
  end;
  function makesqlsintetico_faturamento_tpcobranca_cliente:string;
  begin
    result := 'where saida.cdempresa='+empresa.cdempresa.tostring+' and saida.dtemissao between '+getdtbanco(dti)+' and '+getdtbanco(dtf)+' ';
    sqlmontarlista(cdcliente      , _saida  , _cdcliente      , result);
    sqlmontarlista(cdtpsaida      , _saida  , _cdtpsaida      , result);
    sqlmontarlista(nustdocumento  , _saida  , _nustdocumento  , result);
    sqlmontarlista(cdtpcobranca   , _saida  , _cdtpcobranca   , result);
    sqlmontarlista(cdcondpagto    , _saida  , _cdcondpagto    , result);
    sqlmontarlista(cduf           , _cliente, _cduf           , result);
    sqlmontarlista(cdfornecedor   , _saida  , _cdfornecedor   , result);
    sqlmontarlista(cdrota         , _saida  , _cdrota         , result);
    sqlmontarlista(cdrepresentante, _saida  , _cdrepresentante, result);
    sqlmontarlista(cdproduto      , _itsaida, _cdproduto      , result, 0, boprodutoinversa);
  end;
  function makesqlsintetico_faturamento_tpcobranca_produto:string;
  begin
    result := 'where saida.cdempresa='+empresa.cdempresa.tostring+' and saida.dtemissao between '+getdtbanco(dti)+' and '+getdtbanco(dtf)+' ';
    sqlmontarlista(cdcliente      , _saida  , _cdcliente      , result);
    sqlmontarlista(cdtpsaida      , _saida  , _cdtpsaida      , result);
    sqlmontarlista(nustdocumento  , _saida  , _nustdocumento  , result);
    sqlmontarlista(cdtpcobranca   , _saida  , _cdtpcobranca   , result);
    sqlmontarlista(cdcondpagto    , _saida  , _cdcondpagto    , result);
    sqlmontarlista(cduf           , _cliente, _cduf           , result);
    sqlmontarlista(cdfornecedor   , _saida  , _cdfornecedor   , result);
    sqlmontarlista(cdrota         , _saida  , _cdrota         , result);
    sqlmontarlista(cdrepresentante, _saida  , _cdrepresentante, result);
    sqlmontarlista(cdproduto      , _itsaida, _cdproduto      , result, 0, boprodutoinversa);
  end;
  function makesqlsintetico_faturamento_tpcobranca_dtemissao:string;
  begin
    result := 'where saida.cdempresa='+empresa.cdempresa.tostring+' and saida.dtemissao between '+getdtbanco(dti)+' and '+getdtbanco(dtf)+' ';
    sqlmontarlista(cdcliente      , _saida  , _cdcliente      , result);
    sqlmontarlista(cdtpsaida      , _saida  , _cdtpsaida      , result);
    sqlmontarlista(nustdocumento  , _saida  , _nustdocumento  , result);
    sqlmontarlista(cdtpcobranca   , _saida  , _cdtpcobranca   , result);
    sqlmontarlista(cdcondpagto    , _saida  , _cdcondpagto    , result);
    sqlmontarlista(cduf           , _cliente, _cduf           , result);
    sqlmontarlista(cdfornecedor   , _saida  , _cdfornecedor   , result);
    sqlmontarlista(cdrota         , _saida  , _cdrota         , result);
    sqlmontarlista(cdrepresentante, _saida  , _cdrepresentante, result);
    sqlmontarlista(cdproduto      , _itsaida, _cdproduto      , result, 0, boprodutoinversa);
  end;
  function makesqlsintetico_faturamento_tpcobranca_quebra_cliente:string;
  begin
    result := 'where saida.cdempresa='+empresa.cdempresa.tostring+' and saida.dtemissao between '+getdtbanco(dti)+' and '+getdtbanco(dtf)+' ';
    sqlmontarlista(cdcliente      , _saida  , _cdcliente      , result);
    sqlmontarlista(cdtpsaida      , _saida  , _cdtpsaida      , result);
    sqlmontarlista(nustdocumento  , _saida  , _nustdocumento  , result);
    sqlmontarlista(cdtpcobranca   , _saida  , _cdtpcobranca   , result);
    sqlmontarlista(cdcondpagto    , _saida  , _cdcondpagto    , result);
    sqlmontarlista(cduf           , _cliente, _cduf           , result);
    sqlmontarlista(cdfornecedor   , _saida  , _cdfornecedor   , result);
    sqlmontarlista(cdrota         , _saida  , _cdrota         , result);
    sqlmontarlista(cdrepresentante, _saida  , _cdrepresentante, result);
    sqlmontarlista(cdproduto      , _itsaida, _cdproduto      , result, 0, boprodutoinversa);
  end;
  function makesqlSintetico_faturamento_tpcobranca_quebra_produto:string;
  begin
    result := 'where saida.cdempresa='+empresa.cdempresa.tostring+' and saida.dtemissao between '+getdtbanco(dti)+' and '+getdtbanco(dtf)+' ';
    sqlmontarlista(cdcliente      , _saida  , _cdcliente      , result);
    sqlmontarlista(cdtpsaida      , _saida  , _cdtpsaida      , result);
    sqlmontarlista(nustdocumento  , _saida  , _nustdocumento  , result);
    sqlmontarlista(cdtpcobranca   , _saida  , _cdtpcobranca   , result);
    sqlmontarlista(cdcondpagto    , _saida  , _cdcondpagto    , result);
    sqlmontarlista(cduf           , _cliente, _cduf           , result);
    sqlmontarlista(cdfornecedor   , _saida  , _cdfornecedor   , result);
    sqlmontarlista(cdrota         , _saida  , _cdrota         , result);
    sqlmontarlista(cdrepresentante, _saida  , _cdrepresentante, result);
    sqlmontarlista(cdproduto      , _itsaida, _cdproduto      , result, 0, boprodutoinversa);
  end;
  function makesqlsintetico_faturamento_tpcobranca:string;
  begin
    result := 'where saida.cdempresa='+empresa.cdempresa.tostring+' and saida.dtemissao between '+getdtbanco(dti)+' and '+getdtbanco(dtf)+' ';
    sqlmontarlista(cdcliente      , _saida  , _cdcliente      , result);
    sqlmontarlista(cdtpsaida      , _saida  , _cdtpsaida      , result);
    sqlmontarlista(nustdocumento  , _saida, _nustdocumento  , result);
    sqlmontarlista(cdtpcobranca   , _saida  , _cdtpcobranca   , result);
    sqlmontarlista(cdcondpagto    , _saida  , _cdcondpagto    , result);
    sqlmontarlista(cduf           , _cliente, _cduf           , result);
    sqlmontarlista(cdfornecedor   , _saida  , _cdfornecedor   , result);
    sqlmontarlista(cdrota         , _saida  , _cdrota         , result);
    sqlmontarlista(cdrepresentante, _saida  , _cdrepresentante, result);
    sqlmontarlista(cdproduto      , _itsaida, _cdproduto      , result, 0, boprodutoinversa);
  end;
  function makesqlsinteticocfop:string;
  begin
    result := 'where saida.cdempresa='+empresa.cdempresa.tostring+' and saida.dtemissao between '+getdtbanco(dti)+' and '+getdtbanco(dtf)+' ';
    sqlmontarlista(cdcliente      , _saida  , _cdcliente      , result);
    sqlmontarlista(cdtpsaida      , _saida  , _cdtpsaida      , result);
    sqlmontarlista(nustdocumento  , _saida  , _nustdocumento  , result);
    sqlmontarlista(cdcondpagto    , _saida  , _cdcondpagto    , result);
    sqlmontarlista(cduf           , _cliente, _cduf           , result);
    sqlmontarlista(cdfornecedor   , _saida  , _cdfornecedor   , result);
    sqlmontarlista(cdrota         , _saida  , _cdrota         , result);
    sqlmontarlista(cdrepresentante, _saida  , _cdrepresentante, result);
    sqlmontarlista(cdproduto      , _itsaida, _cdproduto      , result, 0, boprodutoinversa);
    sqlmontarlista(cdcfop         , _itsaida, _cdcfop         , result);
  end;
  function makesqlsinteticoncm:string;
  begin
    result := 'where saida.cdempresa='+empresa.cdempresa.tostring+' and saida.dtemissao between '+getdtbanco(dti)+' and '+getdtbanco(dtf)+' ';
    sqlmontarlista(cdcliente      , _saida  , _cdcliente      , result);
    sqlmontarlista(cdtpsaida      , _saida  , _cdtpsaida      , result);
    sqlmontarlista(nustdocumento  , _saida, _nustdocumento  , result);
    sqlmontarlista(cdcondpagto    , _saida  , _cdcondpagto    , result);
    sqlmontarlista(cduf           , _cliente, _cduf           , result);
    sqlmontarlista(cdfornecedor   , _saida  , _cdfornecedor   , result);
    sqlmontarlista(cdrota         , _saida  , _cdrota         , result);
    sqlmontarlista(cdrepresentante, _saida  , _cdrepresentante, result);
    sqlmontarlista(cdproduto      , _itsaida, _cdproduto      , result, 0, boprodutoinversa);
    sqlmontarlista(cdgrupo        , _produto, _cdgrupo        , result);
  end;
  function makesqlmensalrepresentante:string;
  begin
    result := 'where saida.cdempresa='+empresa.cdempresa.tostring+' and saida.dtemissao between '+getdtbanco(dti)+' and '+getdtbanco(dtf)+' ';
    sqlmontarlista(cdcliente      , _saida, _cdcliente      , result);
    sqlmontarlista(cdserie        , _saida, _cdserie        , result);
    sqlmontarlista(cdtpcobranca   , _saida, _cdtpcobranca   , result);
    sqlmontarlista(cdtpsaida      , _saida, _cdtpsaida      , result);
    sqlmontarlista(nustdocumento  , _saida, _nustdocumento  , result);
    sqlmontarlista(cdcondpagto    , _saida, _cdcondpagto    , result);
    sqlmontarlista(cdfornecedor   , _saida, _cdfornecedor   , result);
    sqlmontarlista(cdrepresentante, _saida, _cdrepresentante, result);
  end;
  function makesqlanaliticofaturamento:string;
  begin
    result := ' and saida.cdempresa='+empresa.cdempresa.tostring+' and saida.dtemissao between '+quotedstr(formatdatetime(_mm_dd_yyyy, dti))+' and '+quotedstr(formatdatetime(_mm_dd_yyyy, dtf))+' ';
    sqlmontarlista(cdcliente      , _saida  , _cdcliente      , result);
    sqlmontarlista(cdcondpagto    , _saida  , _cdcondpagto    , result);
    sqlmontarlista(cdproduto      , _itsaida, _cdproduto      , result);
    sqlmontarlista(cdtpsaida      , _saida  , _cdtpsaida      , result);
    sqlmontarlista(nustdocumento  , _saida  , _nustdocumento  , result);
    sqlmontarlista(cdtpcobranca   , _saida  , _cdtpcobranca   , result);
    sqlmontarlista(cdrepresentante, _saida  , _cdrepresentante, result);
    sqlmontarlista(cdrota         , _cliente, _cdrota         , result);
  end;
  function makesqlwhereFRETE:string;
  begin
    sqlmontarlista(cdproduto      , _I , _cdproduto      , Result, 0, boprodutoinversa);
    sqlmontarlista(cdrepresentante, _s , _cdrepresentante, Result);
    sqlmontarlista(cdcliente      , _s , _cdcliente      , Result);
    sqlmontarlista(cdtpsaida      , _s , _cdtpsaida      , Result);
    sqlmontarlista(nustdocumento  , _s , _nustdocumento  , result);
    sqlmontarlista(cdcondpagto    , _s , _cdcondpagto    , Result);
    sqlmontarlista(cdrota         , _s , _cdrota         , Result);
    sqlmontarlista(cdfornecedor   , _s , _cdfornecedor   , Result);
    Result := 'and s.cdempresa='+empresa.cdempresa.tostring+' ';
  end;
  function makesqlanalitico_lucro:string;
  begin
    result := 'where saida.cdempresa='+empresa.cdempresa.tostring+' and saida.dtemissao between '+getdtbanco(dti)+' and '+getdtbanco(dtf)+' ';
    sqlmontarlista(cdcliente, _saida, _cdcliente, result);
    sqlmontarlista(cdproduto, _itsaida, _cdproduto, result);
    sqlmontarlista(cdtpsaida, _saida, _cdtpsaida, result);
    sqlmontarlista(nustdocumento  , _saida, _nustdocumento  , result);
  end;
  function makesqlsintetico_lucro:string;
  begin
    result := 'where saida.cdempresa='+empresa.cdempresa.tostring+' and saida.dtemissao between '+getdtbanco(dti)+' and '+getdtbanco(dtf)+' ';
    sqlmontarlista(cdcliente, _saida  , _cdcliente, result);
    sqlmontarlista(cdproduto, _itsaida, _cdproduto, result);
    sqlmontarlista(cdtpsaida, _saida  , _cdtpsaida, result);
    sqlmontarlista(nustdocumento  , _saida, _nustdocumento  , result);
  end;
  function getnrecebido:string;
  begin
    if ckbnrecebido.Checked then result := _s
                            else Result := '';
  end;
  procedure criar_objetos;
  begin
    cdcfop          := TStringList.Create;
    cdserie         := TStringList.Create;
    nustdocumento   := TStringList.Create;
    cdcliente       := TStringList.create;
    cduf            := TStringList.create;
    cdmunicipio     := TStringList.Create;
    cdrepresentante := TStringList.create;
    cdtpsaida       := TStringList.create;
    cdcondpagto     := TStringList.create;
    cdproduto       := TStringList.create;
    cdgrupo         := TStringList.create;
    cdrota          := TStringList.create;
    cdfornecedor    := TStringList.create;
    linhas          := TStringList.create;
    cdtpcliente     := TStringList.create;
    cdstordserv     := TStringList.create;
    cdetapa         := TStringList.create;
    cdcntcusto      := TStringList.create;
    cdtpcobranca    := TStringList.create;
    sqlwhere        := TStringList.Create;
  end;
  procedure destruir_objetos;
  begin
    nustdocumento.Free;
    cdcfop.Free;
    cdserie.Free;
    cdcliente.free;
    cduf.free;
    cdmunicipio.Free;
    cdrepresentante.free;
    cdproduto.free;
    cdtpsaida.free;
    cdcondpagto.free;
    cdgrupo.free;
    cdrota.free;
    cdfornecedor.free;
    linhas.free;
    cdtpcliente.free;
    cdstordserv.free;
    cdetapa.free;
    cdcntcusto.free;
    cdtpcobranca.Free;
    sqlwhere.Free;
  end;
  procedure preencher_lista;
  var
    i : Integer;
  begin
    for I := 0 to lsvcfop.Items.count          - 1 do cdcfop.add         (lsvcfop.items         [i].Caption);
    for I := 0 to lsvserie.Items.count         - 1 do cdserie.add        (lsvserie.items        [i].Caption);
    for I := 0 to lsvstdocumento.Items.count   - 1 do nustdocumento.add  (lsvstdocumento.items  [i].Caption);
    for I := 0 to lsvcliente.Items.count       - 1 do cdcliente.add      (lsvCliente.items      [i].Caption);
    for I := 0 to lsvuf.Items.count            - 1 do cduf.add           (lsvuf.items           [i].caption);
    for I := 0 to lsvmunicipio.Items.count     - 1 do cdmunicipio.add    (lsvmunicipio.items    [i].caption);
    for I := 0 to lsvrepresentante.Items.count - 1 do cdrepresentante.add(lsvrepresentante.items[i].caption);
    for I := 0 to lsvproduto.Items.count       - 1 do cdproduto.add      (lsvproduto.items      [i].caption);
    for I := 0 to lsvtpsaida.Items.count       - 1 do cdtpsaida.add      (lsvtpsaida.items      [i].caption);
    for I := 0 to lsvtpcobranca.Items.count    - 1 do cdtpcobranca.add   (lsvtpcobranca.items   [i].caption);
    for I := 0 to lsvcondpagto.Items.count     - 1 do cdcondpagto.add    (lsvcondpagto.items    [i].caption);
    for I := 0 to lsvrota.Items.count          - 1 do cdrota.add         (lsvrota.items         [i].caption);
    for I := 0 to lsvfornecedor.Items.count    - 1 do cdfornecedor.add   (lsvfornecedor.items   [i].caption);
    for I := 0 to lsvgrupo.Items.count         - 1 do cdgrupo.add        (CodigodoCampo(_grupo, lsvgrupo.items[i].caption, _nunivel));
  end;
  function makesqlwhereGrupoProdutos:string;
  begin
    result := 'where representante.cdrepresentante is not null and saida.cdempresa='+empresa.cdempresa.tostring+' and saida.dtemissao between '+getdtbanco(dti)+' and '+getdtbanco(dtf)+' ';
    sqlmontarlista(cdcliente      , _saida  , _cdcliente      , result);
    sqlmontarlista(cdtpsaida      , _saida  , _cdtpsaida      , result);
    sqlmontarlista(nustdocumento  , _saida  , _nustdocumento  , result);
    sqlmontarlista(cdrepresentante, _saida  , _cdrepresentante, result);
    sqlmontarlista(cdproduto      , _itsaida, _cdproduto      , result, 0, boprodutoinversa);
    sqlmontarlista(cdgrupo        , _produto, _cdgrupo        , result);
  end;
  function makesql_308:string;
  begin
    result := 'where saida.cdempresa='+empresa.cdempresa.tostring+' and saida.dtemissao between '+getdtbanco(dti)+' and '+getdtbanco(dtf)+' ';
    sqlmontarlista     (cdcliente      , _saida        , _cdcliente      , result);
    sqlmontarlista     (cduf           , _cliente      , _cduf           , result);
    sqlmontarlista     (cdmunicipio    , _cliente      , _cdmunicipio    , result);
    sqlmontarlista     (cdtpsaida      , _saida        , _cdtpsaida      , result);
    sqlmontarlista     (nustdocumento  , _saida        , _nustdocumento  , result);
    sqlmontarlista     (cdcondpagto    , _saida        , _cdcondpagto    , result);
    sqlmontarlista     (cdtpcobranca   , _saida        , _cdtpcobranca   , result);
    sqlmontarlista     (cdproduto      , _itsaida      , _cdproduto      , result);
    sqlmontarlista     (cdrepresentante, _representante, _cdrepresentante, result);
    sqlmontarlistagrupo(cdgrupo        , _produto      , _cdgrupo        , result);
  end;
  function makesql_308_2:string;
  begin
    result := 'where saida.cdempresa='+empresa.cdempresa.tostring+' and saida.dtemissao between '+getdtbanco(dti)+' and '+getdtbanco(dtf)+' ';
    sqlmontarlista     (cdtpsaida      , _saida        , _cdtpsaida      , result);
    sqlmontarlista     (nustdocumento  , _saida        , _nustdocumento  , result);
    sqlmontarlista     (cdproduto      , _itsaida      , _cdproduto      , result);
    sqlmontarlista     (cdcondpagto    , _saida        , _cdcondpagto    , result);
    sqlmontarlista     (cdtpcobranca   , _saida        , _cdtpcobranca   , result);
    sqlmontarlista     (cdrepresentante, _representante, _cdrepresentante, result);
    sqlmontarlistagrupo(cdgrupo        , _produto      , _cdgrupo        , result);
  end;
  function makesql_308_3:string;
  begin
    result := 'where saida.cdempresa='+empresa.cdempresa.tostring;
    sqlmontarlista     (cdtpsaida      , _saida        , _cdtpsaida      , result);
    sqlmontarlista     (nustdocumento  , _saida        , _nustdocumento  , result);
    sqlmontarlista     (cdcondpagto    , _saida        , _cdcondpagto    , result);
    sqlmontarlista     (cdtpcobranca   , _saida        , _cdtpcobranca   , result);
    sqlmontarlista     (cdproduto      , _itsaida      , _cdproduto      , result);
    sqlmontarlista     (cdrepresentante, _representante, _cdrepresentante, result);
    sqlmontarlistagrupo(cdgrupo        , _produto      , _cdgrupo        , result);
  end;
  function makeSQL_MensalFaturamento:string;
  begin
    result := 'where saida.cdempresa='+empresa.cdempresa.tostring+' and saida.dtemissao between '+getdtbanco(dti)+' and '+getdtbanco(dtf)+'  and tpsaida.boduplicata=''S'' ';
    sqlmontarlista(cdrepresentante, _saida, _cdrepresentante, result);
    sqlmontarlista(cdcliente      , _saida, _cdcliente      , result);
    sqlmontarlista(cdtpsaida      , _saida, _cdtpsaida      , result);
    sqlmontarlista(cdcondpagto    , _saida, _cdcondpagto    , result);
    sqlmontarlista(cdrota         , _saida, _cdrota         , result);
  end;
  function makesqlMensalCliente(recebido: boolean = true):string;
  begin
    result := 'where saida.cdempresa='+empresa.cdempresa.tostring+' and saida.dtemissao between '+getdtbanco(dti)+' and '+getdtbanco(dtf)+' ';
    if recebido then
    begin
      result := result + 'and (select count(*) '+
                              'from duplicata '+
                              'where cdempresa=saida.cdempresa '+
                              'and duplicata.cdsaida=saida.cdsaida)<>(select count(*) '+
                                                                     'from duplicata '+
                                                                     'where cdempresa=saida.cdempresa '+
                                                                     'and cdsaida=saida.cdsaida '+
                                                                     'and duplicata.cdstduplicata <> 1) ';
    end;
    sqlmontarlista     (cdproduto      , _itsaida  , _cdproduto      , result, 0, boprodutoinversa);
    sqlmontarlista     (cdrepresentante, _saida    , _cdrepresentante, result);
    sqlmontarlista     (cdrota         , _saida    , _cdrota         , result);
    sqlmontarlista     (cdcliente      , _saida    , _cdcliente      , result);
    sqlmontarlista     (cdfornecedor   , _saida    , _cdfornecedor   , result);
    sqlmontarlistagrupo(cdgrupo        , _produto  , _cdgrupo        , result, cdproduto.count);
    sqlmontarlista     (cdtpsaida      , _saida    , _cdtp+_saida    , result);
    sqlmontarlista     (cduf           , _cliente  , _cduf           , result);
    sqlmontarlista     (cdtpcliente    , _cliente  , _cdtpcliente    , result);
    sqlmontarlista     (cdstordserv    , _saida    , _cdstordserv    , result);
    sqlmontarlista     (cdetapa        , _saida    , _cdetapa        , result);
  end;
  function makesqlSinteticoFaturamento(boduplicata: boolean = false):string;
  begin
    result := 'where saida.cdempresa='+empresa.cdempresa.tostring+' and saida.dtemissao between '+getdtbanco(dti)+' and '+getdtbanco(dtf)+' ';
    if boduplicata then
    begin
      result := result + ' and tpsaida.boduplicata=' + QuotedStr('S');
    end;
    sqlmontarlista     (cdrepresentante, _saida    , _cdrepresentante, result);
    sqlmontarlista     (cdcliente      , _saida    , _cdcliente      , result);
    sqlmontarlista     (cdfornecedor   , _saida    , _cdfornecedor   , result);
    sqlmontarlista     (cdrota         , _saida    , _cdrota         , result);
    sqlmontarlista     (cduf           , _cliente  , _cduf           , result);
    sqlmontarlista     (cdtpsaida      , _saida    , _cdtp+_saida    , result);
    sqlmontarlista     (cdcondpagto    , _saida    , _cdcondpagto    , result);
  end;
  function makesqlValorFrete:string;
  begin
    result := 'where saida.cdempresa='+empresa.cdempresa.tostring+' and cliente.cduf is not null and saida.dtemissao between '+getdtbanco(dti)+' and '+getdtbanco(dtf)+' ';
    sqlmontarlista (cdtpsaida,       _saida,   _cdtpsaida,       result);
    sqlmontarlista (cdcondpagto,     _saida,   _cdcondpagto,     result);
    sqlmontarlista (cdrepresentante, _saida,   _cdrepresentante, result);
    sqlmontarlista (cdcliente,       _saida,   _cdcliente,       result);
    sqlmontarlista (cdrota,          _saida,   _cdrota,          result);
    sqlmontarlista (cduf,            _cliente, _cduf,            result);
  end;
begin
  mem.Lines.Clear;
  criar_objetos;
  if ckbprodutoacabado.Checked then acabado := _S
                               else acabado := _N;
  consulta := trv.selected.text;
  try
    preencher_lista;
    nopai            := trv.selected.parent.text;
    dti              := edtdti.Date;
    dtf              := edtdtf.Date;
    boprodutoinversa := ckbprodutoinversa.Checked;
    QForm.mudarcontroles(self, false);
    dtmmain.LogSiteAction(self.name, consulta);
    try
      if nopai = 'Fun��o' then
      begin
        if consulta = 'Gerar contas a receber' then
        begin
          TSaidalist.GerarContasAReceber(edtdti.Date, edtdtf.Date);
        end
        else if consulta = 'Entrada Estoque Produto Acabado para Livro Produ��o' then
        begin
          saida := tsaida.create;
          try
            saida.EntradaProdutoData(edtdti.Date, edtdtf.Date, empresa.livroproducao.qtdiaentradaestoque);
          finally
            freeandnil(saida);
          end;
        end
        else if consulta = 'Recalcular Comiss�o' then
        begin
          if saida.RecalcularComissao(dti, dtf) then
          begin
            MessageDlg('Comiss�o recalculada!', mtInformation, [mbOK], 0);
          end;
        end
        else if consulta = 'Recalcular PIS/COFINS' then
        begin
          if saida.RecalcularPisCofins(dti, dtf) then
          begin
            MessageDlg('PIS/COFINS recalculado!', mtInformation, [mbOK], 0);
          end;
        end;
      end
      else if consulta = '308 - Acompanhamento de Vendas' then
      begin
        sqlwhere.Add(makesql_308);
        sqlwhere.Add(makesql_308_2);
        sqlwhere.Add(makesql_308_3);
        sqlwhere.Add(_data);
        imprimir_relatorio_308(308, sqlwhere, dti, dtf, 0, nil);
      end
      else if consulta = '308 - Acompanhamento de Vendas Anual' then
      begin
        sqlwhere.Add(makesql_308);
        sqlwhere.Add(makesql_308_2);
        sqlwhere.Add(makesql_308_3);
        sqlwhere.Add(_anual);
        imprimir_relatorio_308(308, sqlwhere, dti, dtf, 0, nil);
      end
      else if consulta = '308 - Acompanhamento de Vendas Mensal' then
      begin
        sqlwhere.Add(makesql_308);
        sqlwhere.Add(makesql_308_2);
        sqlwhere.Add(makesql_308_3);
        sqlwhere.Add(_mensal);
        imprimir_relatorio_308(308, sqlwhere, dti, dtf, 0, nil);
      end
      else if consulta = '538 - Acumulado por Condi��o de Pagamento'         then ImpimirRelatorioPadrao1(538, makesqlsinteticocondpagto)
      else if consulta = '573 - Sint�tico Lucro de Produto'                  then ImpimirRelatorioPadrao1(573, makesqlanalitico_lucro)
      else if consulta = '601 - Sint�tico Lucro de Produto pelo Custo M�dio' then ImpimirRelatorioPadrao1(601, makesqlanalitico_lucro)
      else if consulta = '354 - Anal�tico'                                   then ImpimirRelatorioPadrao1(354, makesqlanalitico)
      else if consulta = '355 - Anal�tico Faturamento'                       then ImpimirRelatorioPadrao1(355, makesqlanaliticofaturamento)
      else if consulta = '562 - Grupo de Produtos por Representante'         then ImpimirRelatorioPadrao1(562, makesqlwhereGrupoProdutos)
      else if consulta = '602 - Produtos por Representante'                  then ImpimirRelatorioPadrao1(602, makesqlwhereGrupoProdutos)
      else if consulta = '364 - Aproveitamento Cr�dito PIS e COFINS'         then ImpimirRelatorioPadrao1(364, makesqlaproveitamentocreditopiscofins)
      else if consulta = '363 - Apura��o de PIS e COFINS'                    then ImpimirRelatorioPadrao1(363, makesqlwherepiscofins)
      //else if consulta = 'D�bito ICMS'                                       then imprimirconsultasaidadebitoicms            (mem, dti, dtf)
      //else if consulta = 'D�bito ICMS Substitui��o Tribut�ria'               then imprimirconsultasaidadebitoicmssubtrib     (mem, dti, dtf)
      //else if consulta = 'D�bito IPI'                                        then imprimirconsultasaidadebitoipi             (mem, cdcondpagto, cdtpsaida, cdgrupo, dti, dtf)
      else if consulta = '608 - Di�rio'                                      then ImpimirRelatorioPadrao1(608, makesqlsinteticoncm)
      else if consulta = '609 - Di�rio Faturamento'                          then ImpimirRelatorioPadrao1(609, makesqlsinteticoncm)
      //else if consulta = 'Di�rio Frete'                                      then imprimirconsultasaidadiariofrete           (mem, cdcondpagto, cdrepresentante, cdcliente, cdtpsaida, cdrota, dti, dtf)
      else if Consulta = '257 - Di�rio Frete Porcentagem'            then
      begin
        Bloco.clear;
        Bloco.addRule('where',  makesqlwhereFRETE);
        Bloco.addRule('where2', makesqlwhereFRETE);
        Bloco.addRule('datainicial', GetDtBanco(dti));
        Bloco.addRule('datafinal'  , GetDtBanco(dtf));
        ImpimirRelatorioPadrao1(257, Bloco.Search('where').newText, Bloco, consulta);  // base CIPALAM
      end
      //else if consulta = 'Di�rio ICMS'                                then imprimirconsultasaidadiarioicms            (mem, cdcondpagto, cdrepresentante, cdcliente, cdtpsaida, dti, dtf)
      //else if consulta = 'Di�rio Produtos'                            then imprimirconsultasaidadiarioprodutos        (mem, cdcondpagto, cdrepresentante, cdcliente, cdtpsaida, cdrota, dti, dtf)
      //else if consulta = 'ICMS/Frete por Estado Mensal'               then imprimirconsultasaidaicmsfreteporestado    (mem, cdcondpagto, cduf, cdtpsaida, dti, dtf)
      //else if consulta = 'ICMS por Estado Mensal'                     then imprimirconsultasaidaicmsbcporestado       (mem, cdcondpagto, cduf, cdtpsaida, dti, dtf)
      //else if consulta = 'Imposto de Notas Fiscais'                   then imprimirconsultasaidaimposto               (mem, cdcondpagto, cdtpsaida, dti, dtf)
      else if consulta = '610 - Mensal'                               then ImpimirRelatorioPadrao1(610, makesqlsinteticoncm)
      else if consulta = '632 - Mensal por Representante'             then ImpimirRelatorioPadrao1(632, makesqlmensalrepresentante)
      else if consulta = '612 - Mensal Faturamento'                   then ImpimirRelatorioPadrao1(612, makeSQL_MensalFaturamento)
      else if consulta = '611 - Mensal Faturamento por Representante' then ImpimirRelatorioPadrao1(611, makeSQL_MensalFaturamento)
      //else if consulta = 'Mensal Frete'                               then imprimirconsultasaidamensalfrete           (mem, cdcondpagto, cdrepresentante, cdcliente, cdtpsaida, cdrota, dti, dtf)
      else if consulta = '258 - Mensal Frete Porcentagem'      then
      begin
        bloco.clear;
        Bloco.addRule('where',  makesqlwhereFRETE);
        Bloco.addRule('where2', makesqlwhereFRETE);
        Bloco.addRule('datainicial', GetDtBanco(dti));
        Bloco.addRule('datafinal'  , GetDtBanco(dtf));
        ImpimirRelatorioPadrao1(258, Bloco.Search('where').newText, Bloco, consulta);  // base CIPALAM
      end
      //else if consulta = 'Mensal ICMS'                                                    then imprimirconsultasaidamensalicms            (mem, cdcondpagto, cdrepresentante, cdcliente, cdtpsaida, dti, dtf)
      //else if consulta = 'Mensal por Estado'                                              then imprimirconsultasaidamensalporestado       (mem, cdcondpagto, cduf, cdrota, dti, dtf)
      //else if consulta = 'Mensal por Tipo Documento'                                      then imprimirconsultasaidamensalquebratpsaida   (mem, cdcondpagto, cdrepresentante, cdcliente, cdtpsaida, cdrota, dti, dtf)
      else if consulta = '615 - Mensal por Produto (Quebra M�s)'                          then ImpimirRelatorioPadrao1(615, makesqlMensalCliente(ckbnrecebido.Checked))
      else if consulta = '616 - Mensal por Produto (Quebra Produto)'                      then ImpimirRelatorioPadrao1(616, makesqlMensalCliente(ckbnrecebido.Checked))
      else if consulta = '613 - Mensal por Cliente (Quebra M�s)'                          then ImpimirRelatorioPadrao1(613, makesqlMensalCliente(ckbnrecebido.Checked))
      else if consulta = '614 - Mensal por Cliente (Quebra Cliente)'                      then ImpimirRelatorioPadrao1(614, makesqlMensalCliente(ckbnrecebido.Checked))
      //else if consulta = 'por Estado'                                                     then imprimirconsultasaidaporestado             (mem, cdrepresentante, cduf, cdtpsaida, cdrota, dti, dtf)
      //else if consulta = 'Pre�o M�dio Venda Produto'                                      then imprimirconsultaprodutoprecomediovendaproduto    (cdtpsaida, dti, dtf)
      //else if consulta = 'Pre�o M�dio Venda Produto (ICMS 07%/12%/18%)'                   then imprimirconsultasaidaprecomediovendaproduto071218(cdproduto, cdgrupo, cdtpsaida, dti, dtf)
      else if consulta = '617 - Quantidade Vendida Mensal (por Representante)'            then ImpimirRelatorioPadrao1(617, makesqlMensalCliente(ckbnrecebido.Checked))
      else if consulta = '618 - Quantidade Vendida Mensal (por Uf)'                       then ImpimirRelatorioPadrao1(618, makesqlMensalCliente(ckbnrecebido.Checked))
      else if consulta = '412 - Sint�tico'                                                then ImpimirRelatorioPadrao1(412, makesqlsintetico)
      else if consulta = '497 - Gerencial'                                                then ImpimirRelatorioPadrao1(497, makesqlgerencial)
      else if consulta = '413 - Sint�tico Condicao Pagamento'                             then ImpimirRelatorioPadrao1(413, makesqlsinteticocondpagto)
      else if consulta = '426 - Sint�tico CFOP'                                           then ImpimirRelatorioPadrao1(426, makesqlsinteticocfop)
      else if consulta = '33 - Sint�tico Documento Fiscal ICMS'                           then ImpimirRelatorioPadrao1(33, makesqlsinteticocfop)
      else if consulta = '34 - Sint�tico Situa��o Tribut�ria do PIS'                      then ImpimirRelatorioPadrao1(34, makesqlsinteticocfop)
      else if consulta = '35 - Sint�tico Situa��o Tribut�ria do ICMS'                     then ImpimirRelatorioPadrao1(35, makesqlsinteticocfop)
      else if consulta = '496 - Sint�tico NCM'                                            then ImpimirRelatorioPadrao1(496, makesqlsinteticoncm)
      else if consulta = '619 - Sint�tico Faturamento'                                    then ImpimirRelatorioPadrao1(619, makesqlSinteticoFaturamento(true))
      else if consulta = '620 - Sint�tico Faturamento por Representante'                  then ImpimirRelatorioPadrao1(620, makesqlSinteticoFaturamento(true))
      else if consulta = '446 - Sint�tico Faturamento por Tipo Cobran�a'                  then ImpimirRelatorioPadrao1(446, makesqlsintetico_faturamento_tpcobranca)
      else if consulta = '448 - Sint�tico Faturamento por Tipo Cobran�a (quebra produto)' then ImpimirRelatorioPadrao1(448, makesqlSintetico_faturamento_tpcobranca_quebra_produto)
      else if consulta = '449 - Sint�tico Faturamento por Tipo Cobran�a (quebra cliente)' then ImpimirRelatorioPadrao1(449, makesqlsintetico_faturamento_tpcobranca_quebra_cliente)
      else if consulta = '450 - Sint�tico Faturamento por Tipo Cobran�a (data emiss�o)'   then ImpimirRelatorioPadrao1(450, makesqlsintetico_faturamento_tpcobranca_dtemissao)
      else if consulta = '451 - Sint�tico Faturamento por Tipo Cobran�a (produto)'        then ImpimirRelatorioPadrao1(451, makesqlsintetico_faturamento_tpcobranca_produto)
      else if consulta = '452 - Sint�tico Faturamento por Tipo Cobran�a (cliente)'        then ImpimirRelatorioPadrao1(452, makesqlsintetico_faturamento_tpcobranca_cliente)
      //else if consulta = 'Sint�tico Frete'                                                then imprimirconsultasaidasinteticofrete           (mem, cdcondpagto, cdrepresentante, cdcliente, cdproduto, cdtpsaida, cdrota, dti, dtf)
      //else if consulta = 'Sint�tico Frete por Cidade'                                     then imprimirconsultasaidasinteticofreteporcidade  (cdcondpagto, cdrepresentante, cdcliente, cdproduto, cdtpsaida, cduf, cdrota, dti, dtf)
      //else if consulta = 'Sint�tico Frete Porcentagem'                                    then imprimirconsultasaidasinteticofreteporcentagem(mem, cdcondpagto, cdrepresentante, cdcliente, cdproduto, cdtpsaida, cdrota, dti, dtf)
      //else if consulta = 'Sint�tico ICMS'                                                 then imprimirconsultasaidasinteticoicms            (mem, cdcondpagto, cdrepresentante, cdcliente, cdproduto, cdtpsaida, dti, dtf, _icms)
      else if consulta = '311 - Sint�tico ISS'                                            then ImpimirRelatorioPadrao1(311, makesqlsinteticoiss)
      else if consulta = '348 - Sint�tico PIS e COFINS'                                   then ImpimirRelatorioPadrao1(348, makesqlwherepiscofins)
      else if consulta = 'Valor do ICMS Mensal (por Uf)'                                  then imprimirconsultasaidamensalreferenciacruzada(cdcondpagto, cdrepresentante, cduf, cdrota, cdtpsaida, cdgrupo, cdproduto, cdcntcusto, dti, dtf, 'Uf',            _vlicms    , acabado, _saida)
      else if consulta = 'Valor do IPI  Mensal (por Uf)'                                  then imprimirconsultasaidamensalreferenciacruzada(cdcondpagto, cdrepresentante, cduf, cdrota, cdtpsaida, cdgrupo, cdproduto, cdcntcusto, dti, dtf, 'Uf',            _vlipi     , acabado, _saida)
      else if consulta = 'Valor da base ICMS Mensal (por Uf)'                             then imprimirconsultasaidamensalreferenciacruzada(cdcondpagto, cdrepresentante, cduf, cdrota, cdtpsaida, cdgrupo, cdproduto, cdcntcusto, dti, dtf, 'Uf',            _vlbaseicms, acabado, _saida)
      else if consulta = 'Valor da base IPI Mensal (por Uf)'                              then imprimirconsultasaidamensalreferenciacruzada(cdcondpagto, cdrepresentante, cduf, cdrota, cdtpsaida, cdgrupo, cdproduto, cdcntcusto, dti, dtf, 'Uf',            _vlbaseipi , acabado, _saida)
      else if consulta = 'Valor do Frente Mensal (por Uf)'                                then imprimirconsultasaidamensalreferenciacruzada(cdcondpagto, cdrepresentante, cduf, cdrota, cdtpsaida, cdgrupo, cdproduto, cdcntcusto, dti, dtf, 'Uf',            _vlfrete   , acabado, _saida)
      else if consulta = 'Valor de Comissao Mensal (por Uf)'                              then imprimirconsultasaidamensalreferenciacruzada(cdcondpagto, cdrepresentante, cduf, cdrota, cdtpsaida, cdgrupo, cdproduto, cdcntcusto, dti, dtf, 'Uf',            _vlcomissao, acabado, _saida)
      else if consulta = 'Valor de Comissao Mensal (por Representante)'                   then imprimirconsultasaidamensalreferenciacruzada(cdcondpagto, cdrepresentante, cduf, cdrota, cdtpsaida, cdgrupo, cdproduto, cdcntcusto, dti, dtf, _Representante, _vlcomissao, acabado, _saida)
      else if consulta = '621 - Valor Frete Mensal'                                       then ImpimirRelatorioPadrao1(621, makesqlValorFrete)
      else if consulta = '622 - Valor Frete Mensal por Estado'                            then ImpimirRelatorioPadrao1(622, makesqlValorFrete)
      else if consulta = 'Valor Vendido Mensal (por Produto)'                             then imprimirconsultasaidamensalreferenciacruzada(cdcondpagto, cdrepresentante, cduf, cdrota, cdtpsaida, cdgrupo, cdproduto, cdcntcusto, dti, dtf, _produto       , _vltotal, acabado, _saida)
      else if consulta = 'Valor Vendido Mensal (por Representante)'                       then imprimirconsultasaidamensalreferenciacruzada(cdcondpagto, cdrepresentante, cduf, cdrota, cdtpsaida, cdgrupo, cdproduto, cdcntcusto, dti, dtf, _Representante, _vltotal, acabado, _saida)
      else if consulta = 'Valor Vendido Mensal (por Uf)'                                  then imprimirconsultasaidamensalreferenciacruzada(cdcondpagto, cdrepresentante, cduf, cdrota, cdtpsaida, cdgrupo, cdproduto, cdcntcusto, dti, dtf, 'Uf'           , _vltotal, acabado, _saida);
    finally
      QForm.mudarcontroles(self, true);
    end;
    if mem.Lines.Count > 0 then
    begin
      ntb.activepage := _texto;
      mem.SelStart   := 1;
    end;
  finally
    destruir_objetos;
  end;
end;

procedure TfrmConsultaSaida.trvChange(Sender: TObject; Node: TTreeNode);
var
  consulta : string;
begin
  ntb.ActivePage      := 'Default';
  consulta            := node.text;
  actGerar.Enabled    := False;
  tbsserie.TabVisible         := false;
  if consulta = '348 - Sint�tico PIS e COFINS' then
  begin
    actGerar.Enabled            := true;
    pgc.Visible                 := true;
    tbsrepresentante.TabVisible := true;
    tbsCliente.TabVisible       := true;
    tbscfop.TabVisible          := false;
    tbsfornecedor.TabVisible    := false;
    tbsproduto.TabVisible       := false;
    tbsgrupo.tabvisible         := false;
    tbstpsaida.TabVisible       := true;
    tbsuf.TabVisible            := false;
    tbsrota.TabVisible          := False;
    tbsmunicipio.TabVisible     := false;
    tbscondpagto.TabVisible     := false;
    tbstpcobranca.TabVisible    := false;
    ckbnrecebido.Visible        := false;
    lblinicial.Visible          := true;
    lblfinal.Visible            := true;
    edtdti.Visible              := true;
    edtdtf.Visible              := true;
    lblpeso.Visible             := false;
    edtpesof.Visible            := false;
    edtpesoi.Visible            := false;
  end
  else if (consulta = '562 - Grupo de Produtos por Representante') or (consulta = '602 - Produtos por Representante') then
  begin
    actGerar.Enabled            := true;
    tbsrepresentante.TabVisible := true;
    tbsCliente.TabVisible       := true;
    tbscfop.TabVisible          := false;
    tbsproduto.TabVisible       := true;
    tbsgrupo.tabvisible         := true;
    tbsuf.TabVisible            := true;
    lblinicial.Visible          := true;
    lblfinal.Visible            := true;
    edtdti.Visible              := true;
    edtdtf.Visible              := true;
    tbsmunicipio.TabVisible     := false;

    lblpeso.Visible             := false;
    edtpesof.Visible            := false;
    edtpesoi.Visible            := false;
    tbstpcobranca.TabVisible    := false;
    ckbnrecebido.Visible        := false;
    tbsrota.TabVisible          := False;
    tbscondpagto.TabVisible     := false;
  end
  else if consulta = '363 - Apura��o de PIS e COFINS' then
  begin
    actGerar.Enabled            := true;
    pgc.Visible                 := true;
    tbsrepresentante.TabVisible := true;
    tbsCliente.TabVisible       := true;
    tbscfop.TabVisible          := false;
    tbsfornecedor.TabVisible    := false;
    tbsproduto.TabVisible       := false;
    tbsgrupo.tabvisible         := false;
    tbstpsaida.TabVisible       := true;
    tbsuf.TabVisible            := false;
    tbsrota.TabVisible          := False;
    tbsmunicipio.TabVisible     := false;

    tbscondpagto.TabVisible     := false;

    tbstpcobranca.TabVisible    := false;
    ckbnrecebido.Visible        := false;
    lblinicial.Visible          := true;
    lblfinal.Visible            := true;
    edtdti.Visible              := true;
    edtdtf.Visible              := true;
    lblpeso.Visible             := false;
    edtpesof.Visible            := false;
    edtpesoi.Visible            := false;
  end
  else if consulta = '364 - Aproveitamento Cr�dito PIS e COFINS' then
  begin
    actGerar.Enabled            := true;
    pgc.Visible                 := true;
    tbsrepresentante.TabVisible := true;
    tbsCliente.TabVisible       := true;
    tbscfop.TabVisible          := false;
    tbsfornecedor.TabVisible    := false;
    tbsproduto.TabVisible       := false;
    tbsgrupo.tabvisible         := false;
    tbstpsaida.TabVisible       := true;
    tbsuf.TabVisible            := false;
    tbsrota.TabVisible          := False;
    tbsmunicipio.TabVisible     := false;

    tbscondpagto.TabVisible     := false;

    tbstpcobranca.TabVisible    := false;
    ckbnrecebido.Visible        := false;
    lblinicial.Visible          := true;
    lblfinal.Visible            := true;
    edtdti.Visible              := true;
    edtdtf.Visible              := true;
    lblpeso.Visible             := false;
    edtpesof.Visible            := false;
    edtpesoi.Visible            := false;
  end
  else if consulta = '613 - Mensal por Cliente (Quebra M�s)' then
  begin
    actGerar.Enabled            := true;
    pgc.Visible                 := true;
    tbsrepresentante.TabVisible := true;
    tbsCliente.TabVisible       := true;
    tbscfop.TabVisible          := false;
    tbsfornecedor.TabVisible    := true;
    tbsproduto.TabVisible       := true;
    tbsgrupo.tabvisible         := true;
    tbstpsaida.TabVisible       := true;
    tbsuf.TabVisible            := true;
    tbsrota.TabVisible          := true;
    tbsmunicipio.TabVisible     := false;

    tbscondpagto.TabVisible     := false;

    tbstpcobranca.TabVisible    := false;
    ckbnrecebido.Visible        := true;
    lblinicial.Visible          := true;
    lblfinal.Visible            := true;
    edtdti.Visible              := true;
    edtdtf.Visible              := true;
    lblpeso.Visible             := false;
    edtpesof.Visible            := false;
    edtpesoi.Visible            := false;
  end
  else if consulta = '614 - Mensal por Cliente (Quebra Cliente)' then
  begin
    actGerar.Enabled            := true;
    pgc.Visible                 := true;
    tbsrepresentante.TabVisible := true;
    tbsCliente.TabVisible       := true;
    tbscfop.TabVisible          := false;
    tbsfornecedor.TabVisible    := true;
    tbsproduto.TabVisible       := true;
    tbsgrupo.tabvisible         := true;
    tbstpsaida.TabVisible       := true;
    tbsuf.TabVisible            := true;
    tbsrota.TabVisible          := true;
    tbsmunicipio.TabVisible     := false;

    tbscondpagto.TabVisible     := false;

    tbstpcobranca.TabVisible    := false;
    ckbnrecebido.Visible        := true;
    lblinicial.Visible          := true;
    lblfinal.Visible            := true;
    edtdti.Visible              := true;
    edtdtf.Visible              := true;
    lblpeso.Visible             := false;
    edtpesof.Visible            := false;
    edtpesoi.Visible            := false;
  end
  else if consulta = 'Valor Vendido Mensal (por Produto)' then
  begin
    actGerar.Enabled            := true;
    pgc.Visible                 := true;
    tbscondpagto.TabVisible     := true;
    tbsrepresentante.TabVisible := true;
    tbsuf.TabVisible            := true;
    tbsrota.TabVisible          := true;
    tbstpsaida.TabVisible       := true;
    tbsgrupo.tabvisible         := true;
    tbsproduto.TabVisible       := true;
    tbsmunicipio.TabVisible     := false;

    tbsCliente.TabVisible       := false;
    tbscfop.TabVisible          := false;
    tbstpcobranca.TabVisible    := false;
    tbsfornecedor.TabVisible    := false;
    ckbnrecebido.Visible        := false;
    lblinicial.Visible          := true;
    lblfinal.Visible            := true;
    edtdti.Visible              := true;
    edtdtf.Visible              := true;
    lblpeso.Visible             := false;
    edtpesof.Visible            := false;
    edtpesoi.Visible            := false;
  end
  else if consulta = '311 - Sint�tico ISS' then
  begin
    actGerar.Enabled            := true;
    ckbnrecebido.Visible        := false;
    tbstpcobranca.TabVisible    := True;
    lblinicial.Visible          := true;
    lblfinal.Visible            := true;
    edtdtf.Visible              := true;
    edtdti.Visible              := true;
    tbsmunicipio.TabVisible     := false;
    lblpeso.visible             := false;
    edtpesof.Visible            := false;
    edtpesoi.Visible            := false;
    pgc.Visible                 := true;
    tbsrepresentante.TabVisible := true;
    tbsCliente.TabVisible       := true;
    tbscfop.TabVisible          := false;
    tbsfornecedor.TabVisible    := true;
    tbsproduto.TabVisible       := false;
    tbstpsaida.TabVisible       := true;
    tbsuf.TabVisible            := true;
    tbsrota.TabVisible          := false;
    tbsgrupo.tabvisible         := false;
  end
  else if (consulta = 'Recalcular Pedido - Qtd Atendida') or
          (consulta = 'Gerar contas a receber') or
          (consulta = 'Entrada Estoque Produto Acabado para Livro Produ��o') then
  begin
    actGerar.Enabled            := true;
    pgc.Visible                 := false;
    tbsCliente.TabVisible       := false;
    tbscfop.TabVisible          := false;
    tbstpsaida.TabVisible       := false;
    tbsproduto.TabVisible       := false;
    tbsmunicipio.TabVisible     := false;

    tbsgrupo.tabvisible         := false;
    tbsrepresentante.TabVisible := false;
    tbscondpagto.TabVisible     := False;
    tbstpcobranca.TabVisible    := false;
    tbsfornecedor.TabVisible    := false;
    tbsrota.TabVisible          := false;
    tbsuf.TabVisible            := false;

    ckbnrecebido.Visible        := false;
    lblinicial.Visible          := true;
    lblfinal.Visible            := true;
    edtdti.Visible              := true;
    edtdtf.Visible              := true;
    lblpeso.Visible             := false;
    edtpesof.Visible            := false;
    edtpesoi.Visible            := false;
  end
  else if (consulta = '573 - Sint�tico Lucro de Produto') or (consulta = '601 - Sint�tico Lucro de Produto pelo Custo M�dio') then
  begin
    actGerar.Enabled            := true;
    pgc.Visible                 := true;
    tbsCliente.TabVisible       := true;
    tbscfop.TabVisible          := false;
    tbstpsaida.TabVisible       := true;
    tbsproduto.TabVisible       := true;
    tbsmunicipio.TabVisible     := false;

    tbsgrupo.tabvisible         := false;
    tbsrepresentante.TabVisible := false;
    tbscondpagto.TabVisible     := False;
    tbstpcobranca.TabVisible    := false;
    tbsfornecedor.TabVisible    := false;
    tbsrota.TabVisible          := false;
    tbsuf.TabVisible            := false;

    ckbnrecebido.Visible        := false;
    lblinicial.Visible          := true;
    lblfinal.Visible            := true;
    edtdti.Visible              := true;
    edtdtf.Visible              := true;
    lblpeso.Visible             := false;
    edtpesof.Visible            := false;
    edtpesoi.Visible            := false;
  end
  else if (consulta = '308 - Acompanhamento de Vendas') or
          (consulta = '308 - Acompanhamento de Vendas Mensal') or
          (consulta = '308 - Acompanhamento de Vendas Anual') then
  begin
    actGerar.Enabled            := true;
    pgc.Visible                 := true;
    tbsCliente.TabVisible       := true;
    tbscfop.TabVisible          := false;
    tbstpsaida.TabVisible       := true;
    tbsproduto.TabVisible       := true;
    tbsgrupo.tabvisible         := true;
    tbsrepresentante.TabVisible := true;
    tbscondpagto.TabVisible     := true;
    tbstpcobranca.TabVisible    := true;
    tbsuf.TabVisible            := true;
    tbsmunicipio.TabVisible     := true;

    tbsfornecedor.TabVisible    := false;
    tbsrota.TabVisible          := false;


    ckbnrecebido.Visible        := false;
    lblinicial.Visible          := true;
    lblfinal.Visible            := true;
    edtdti.Visible              := true;
    edtdtf.Visible              := true;
    lblpeso.Visible             := false;
    edtpesof.Visible            := false;
    edtpesoi.Visible            := false;
  end
  else if consulta = '354 - Anal�tico' then
  begin
    actGerar.Enabled    := true;
    ckbnrecebido.Visible := false;
    pgc.Visible := true;
    tbsrepresentante.TabVisible := true;
    tbstpcobranca.TabVisible    := false;
    tbsCliente.TabVisible       := true;
    tbscfop.TabVisible          := false;
    tbsfornecedor.TabVisible    := false;
    tbsproduto.TabVisible       := true;
    tbstpsaida.TabVisible       := true;
    tbsrota.TabVisible          := true;
    tbsuf.TabVisible            := false;
    tbsmunicipio.TabVisible     := false;
    tbsgrupo.tabvisible         := false;
    lblinicial.Visible          := true;
    lblfinal.Visible            := true;
    edtdti.Visible              := true;
    edtdtf.Visible              := true;
    lblpeso.Visible             := false;
    edtpesof.Visible            := false;
    edtpesoi.Visible            := false;
  end
  else if consulta = '355 - Anal�tico Faturamento' then
  begin
    actGerar.Enabled    := true;
    ckbnrecebido.Visible        := false;
    pgc.Visible                 := true;
    tbsrepresentante.TabVisible := true;
    tbstpcobranca.TabVisible    := true;
    tbsCliente.TabVisible       := true;
    tbscfop.TabVisible          := false;
    tbsfornecedor.TabVisible    := false;
    tbsmunicipio.TabVisible     := false;
    tbsproduto.TabVisible       := true;
    tbstpsaida.TabVisible       := true;
    tbsrota.TabVisible          := true;
    tbsuf.TabVisible            := false;
    tbsgrupo.tabvisible         := false;
    lblinicial.Visible          := true;
    lblfinal.Visible            := true;
    edtdti.Visible              := true;
    edtdtf.Visible              := true;
    lblpeso.Visible             := false;
    edtpesof.Visible            := false;
    edtpesoi.Visible            := false;
  end
  {else if consulta = 'D�bito IPI' then
  begin
    actGerar.Enabled    := true;
    ckbnrecebido.Visible := false;
    tbstpcobranca.TabVisible    := false;
    lblinicial.Visible          := true;
    lblfinal.Visible            := true;
    edtdtf.Visible              := true;
    edtdti.Visible              := true;
    tbsmunicipio.TabVisible     := false;
    lblpeso.visible             := false;
    edtpesof.Visible            := false;
    edtpesoi.Visible            := false;
    pgc.Visible                 := true;
    tbstpsaida.TabVisible       := true;
    tbscliente.tabvisible       := false;
    tbscfop.TabVisible          := false;
    tbsfornecedor.TabVisible    := false;
    tbsgrupo.tabvisible         := true;
    tbsrepresentante.tabvisible := false;
    tbsuf.TabVisible            := false;
    tbsproduto.TabVisible       := false;
    tbsrota.TabVisible          := false;
  end}
  else if (consulta = '615 - Mensal por Produto (Quebra M�s)') or (consulta = '616 - Mensal por Produto (Quebra Produto)') then
  begin
    actGerar.Enabled    := true;
    ckbnrecebido.Visible := True;
    tbstpcobranca.TabVisible    := false;
    lblinicial.Visible          := true;
    lblfinal.Visible            := true;
    edtdtf.Visible              := true;
    edtdti.Visible              := true;
    tbsmunicipio.TabVisible     := false;

    lblpeso.visible             := false;
    edtpesof.Visible            := false;
    edtpesoi.Visible            := false;
    pgc.Visible                 := true;

    tbsrepresentante.tabvisible := true;
    tbscliente.tabvisible       := true;
    tbscfop.TabVisible          := false;
    tbsfornecedor.TabVisible    := true;
    tbsproduto.TabVisible       := true;
    tbsgrupo.tabvisible         := true;
    tbstpsaida.TabVisible       := true;
    tbsuf.TabVisible            := true;
    tbsrota.TabVisible          := true;
  end
  {else if //(consulta = 'D�bito ICMS') or
         (consulta = 'D�bito ICMS Substitui��o Tribut�ria') then
  begin
    actGerar.Enabled         := true;
    ckbnrecebido.Visible     := false;
    tbstpcobranca.TabVisible := false;
    tbscfop.TabVisible          := false;
    tbsmunicipio.TabVisible  := false;
    lblinicial.Visible       := true;
    lblfinal.Visible         := true;
    edtdtf.Visible           := true;
    edtdti.Visible           := true;
    lblpeso.visible          := false;
    edtpesof.Visible         := false;
    edtpesoi.Visible         := false;
    pgc.Visible              := false;
  end}
  else if (consulta = 'Recalcular Comiss�o') or (consulta = 'Recalcular PIS/COFINS')then
  begin
    actGerar.Enabled            := true;
    ckbnrecebido.Visible        := false;
    tbstpcobranca.TabVisible    := false;
    tbsmunicipio.TabVisible     := false;
    lblinicial.Visible          := true;
    lblfinal.Visible            := true;
    edtdtf.Visible              := true;
    edtdti.Visible              := true;
    lblpeso.visible             := false;
    edtpesof.Visible            := false;
    edtpesoi.Visible            := false;
    pgc.Visible                 := true;
    tbscliente.TabVisible       := false;
    tbscfop.TabVisible          := false;
    tbsuf.TabVisible            := false;
    tbsproduto.TabVisible       := false;
    tbstpsaida.TabVisible       := false;
    tbsgrupo.TabVisible         := false;
    tbsrota.TabVisible          := false;
    tbsfornecedor.TabVisible    := false;
    tbsrepresentante.TabVisible := true;
  end
  else if consulta = '622 - Valor Frete Mensal por Estado' then
  begin
    actGerar.Enabled            := true;
    ckbnrecebido.Visible        := false;
    tbstpcobranca.TabVisible    := false;
    tbsmunicipio.TabVisible     := false;
    lblinicial.Visible          := true;
    lblfinal.Visible            := true;
    edtdtf.Visible              := true;
    edtdti.Visible              := true;
    lblpeso.visible             := false;
    edtpesof.Visible            := false;
    edtpesoi.Visible            := false;
    pgc.Visible                 := true;
    tbstpsaida.TabVisible       := true;
    tbsCliente.TabVisible       := false;
    tbscfop.TabVisible          := false;
    tbsfornecedor.TabVisible    := false;
    tbsuf.TabVisible            := true;
    tbsrepresentante.TabVisible := false;
    tbsproduto.TabVisible       := false;
    tbsrota.TabVisible          := false;
  end
  else if //(consulta = 'Pre�o M�dio Venda Produto') or
  (consulta = '621 - Valor Frete Mensal') //or (consulta = 'Imposto de Notas Fiscais')
  then
  begin
    actGerar.Enabled            := true;
    ckbnrecebido.Visible        := false;
    tbstpcobranca.TabVisible    := false;
    tbsmunicipio.TabVisible     := false;
    lblinicial.Visible          := true;
    lblfinal.Visible            := true;
    edtdtf.Visible              := true;
    edtdti.Visible              := true;
    lblpeso.visible             := false;
    edtpesof.Visible            := false;
    edtpesoi.Visible            := false;
    pgc.Visible                 := true;
    tbstpsaida.TabVisible       := true;
    tbsCliente.TabVisible       := false;
    tbscfop.TabVisible          := false;
    tbsfornecedor.TabVisible    := false;
    tbsuf.TabVisible            := false;
    tbsrepresentante.TabVisible := false;
    tbsproduto.TabVisible       := false;
    tbsrota.TabVisible          := false;
  end
  {else if consulta = 'Pre�o M�dio Venda Produto (ICMS 07%/12%/18%)' then
  begin
    actGerar.Enabled            := true;
    ckbnrecebido.Visible        := false;
    tbstpcobranca.TabVisible    := false;
    tbsmunicipio.TabVisible     := false;
    lblinicial.Visible          := true;
    lblfinal.Visible            := true;
    edtdtf.Visible              := true;
    edtdti.Visible              := true;
    lblpeso.visible             := false;
    edtpesof.Visible            := false;
    edtpesoi.Visible            := false;
    pgc.Visible                 := true;
    tbstpsaida.TabVisible       := true;
    tbsCliente.TabVisible       := false;
    tbscfop.TabVisible          := false;
    tbsfornecedor.TabVisible    := false;
    tbsuf.TabVisible            := false;
    tbsrepresentante.TabVisible := false;
    tbsgrupo.tabvisible         := true;
    tbsproduto.TabVisible       := true;
    tbsrota.TabVisible          := false;
  end}
  {else if (consulta = 'ICMS por Estado Mensal') //or (consulta = 'ICMS/Frete por Estado Mensal')
  then
  begin
    actGerar.Enabled            := true;
    ckbnrecebido.Visible        := false;
    tbstpcobranca.TabVisible    := false;
    tbsmunicipio.TabVisible     := false;
    lblinicial.Visible          := true;
    lblfinal.Visible            := true;
    edtdtf.Visible              := true;
    edtdti.Visible              := true;
    lblpeso.visible             := false;
    edtpesof.Visible            := false;
    edtpesoi.Visible            := false;
    pgc.Visible                 := true;
    tbstpsaida.TabVisible       := true;
    tbsuf.TabVisible            := true;
    tbsCliente.TabVisible       := false;
    tbscfop.TabVisible          := false;
    tbsfornecedor.TabVisible    := false;
    tbsrepresentante.TabVisible := false;
    tbsproduto.TabVisible       := false;
    tbsrota.TabVisible          := false;
  end}
  {else if consulta = 'Mensal por Estado' then
  begin
    actGerar.Enabled            := true;
    ckbnrecebido.Visible        := false;
    tbstpcobranca.TabVisible    := false;
    tbsmunicipio.TabVisible     := false;
    lblinicial.Visible          := true;
    lblfinal.Visible            := true;
    edtdtf.Visible              := true;
    edtdti.Visible              := true;
    lblpeso.visible             := false;
    edtpesof.Visible            := false;
    edtpesoi.Visible            := false;
    pgc.Visible                 := true;
    tbsuf.TabVisible            := true;
    tbsCliente.TabVisible       := false;
    tbscfop.TabVisible          := false;
    tbsfornecedor.TabVisible    := false;
    tbsrepresentante.TabVisible := false;
    tbsproduto.TabVisible       := false;
    tbstpsaida.TabVisible       := false;
    tbsrota.TabVisible          := true;
  end}
  {else if consulta = 'por Estado' then
  begin
    actGerar.Enabled            := true;
    ckbnrecebido.Visible        := false;
    tbstpcobranca.TabVisible    := false;
    tbsmunicipio.TabVisible     := false;
    lblinicial.Visible          := true;
    lblfinal.Visible            := true;
    edtdtf.Visible              := true;
    edtdti.Visible              := true;
    lblpeso.visible             := false;
    edtpesof.Visible            := false;
    edtpesoi.Visible            := false;
    pgc.Visible                 := true;
    tbsrepresentante.TabVisible := true;
    tbstpsaida.TabVisible       := true;
    tbsuf.TabVisible            := true;
    tbsCliente.TabVisible       := false;
    tbscfop.TabVisible          := false;
    tbsfornecedor.TabVisible    := false;
    tbsproduto.TabVisible       := false;
    tbsrota.TabVisible          := true;
  end}
  else if (consulta = '426 - Sint�tico CFOP') then
  begin
    actGerar.Enabled            := true;
    ckbnrecebido.Visible        := false;
    tbstpcobranca.TabVisible    := True;
    lblinicial.Visible          := true;
    lblfinal.Visible            := true;
    edtdtf.Visible              := true;
    edtdti.Visible              := true;
    tbsmunicipio.TabVisible     := false;
    lblpeso.visible             := false;
    edtpesof.Visible            := false;
    edtpesoi.Visible            := false;
    pgc.Visible                 := true;
    tbsrepresentante.TabVisible := true;
    tbsCliente.TabVisible       := true;
    tbscfop.TabVisible          := true;
    tbsfornecedor.TabVisible    := true;
    tbsproduto.TabVisible       := true;
    tbstpsaida.TabVisible       := true;
    tbsuf.TabVisible            := true;
    tbsrota.TabVisible          := true;
    tbsgrupo.tabvisible         := false;
  end
  else if (consulta = '33 - Sint�tico Documento Fiscal ICMS') then
  begin
    actGerar.Enabled            := true;
    ckbnrecebido.Visible        := false;
    tbstpcobranca.TabVisible    := True;
    lblinicial.Visible          := true;
    lblfinal.Visible            := true;
    edtdtf.Visible              := true;
    edtdti.Visible              := true;
    tbsmunicipio.TabVisible     := false;
    lblpeso.visible             := false;
    edtpesof.Visible            := false;
    edtpesoi.Visible            := false;
    pgc.Visible                 := true;
    tbsrepresentante.TabVisible := true;
    tbsCliente.TabVisible       := true;
    tbscfop.TabVisible          := true;
    tbsfornecedor.TabVisible    := true;
    tbsproduto.TabVisible       := true;
    tbstpsaida.TabVisible       := true;
    tbsuf.TabVisible            := true;
    tbsrota.TabVisible          := true;
    tbsgrupo.tabvisible         := false;
  end
  else if (consulta = '34 - Sint�tico Situa��o Tribut�ria do PIS') then
  begin
    actGerar.Enabled            := true;
    ckbnrecebido.Visible        := false;
    tbstpcobranca.TabVisible    := True;
    lblinicial.Visible          := true;
    lblfinal.Visible            := true;
    edtdtf.Visible              := true;
    edtdti.Visible              := true;
    tbsmunicipio.TabVisible     := false;
    lblpeso.visible             := false;
    edtpesof.Visible            := false;
    edtpesoi.Visible            := false;
    pgc.Visible                 := true;
    tbsrepresentante.TabVisible := true;
    tbsCliente.TabVisible       := true;
    tbscfop.TabVisible          := true;
    tbsfornecedor.TabVisible    := true;
    tbsproduto.TabVisible       := true;
    tbstpsaida.TabVisible       := true;
    tbsuf.TabVisible            := true;
    tbsrota.TabVisible          := true;
    tbsgrupo.tabvisible         := false;
  end
  else if (consulta = '35 - Sint�tico Situa��o Tribut�ria do ICMS') then
  begin
    actGerar.Enabled            := true;
    ckbnrecebido.Visible        := false;
    tbstpcobranca.TabVisible    := True;
    lblinicial.Visible          := true;
    lblfinal.Visible            := true;
    edtdtf.Visible              := true;
    edtdti.Visible              := true;
    tbsmunicipio.TabVisible     := false;
    lblpeso.visible             := false;
    edtpesof.Visible            := false;
    edtpesoi.Visible            := false;
    pgc.Visible                 := true;
    tbsrepresentante.TabVisible := true;
    tbsCliente.TabVisible       := true;
    tbscfop.TabVisible          := true;
    tbsfornecedor.TabVisible    := true;
    tbsproduto.TabVisible       := true;
    tbstpsaida.TabVisible       := true;
    tbsuf.TabVisible            := true;
    tbsrota.TabVisible          := true;
    tbsgrupo.tabvisible         := false;
  end
  else if consulta = '496 - Sint�tico NCM' then
  begin
    actGerar.Enabled            := true;
    ckbnrecebido.Visible        := false;
    tbstpcobranca.TabVisible    := True;
    lblinicial.Visible          := true;
    lblfinal.Visible            := true;
    edtdtf.Visible              := true;
    edtdti.Visible              := true;
    tbsmunicipio.TabVisible     := false;
    lblpeso.visible             := false;
    edtpesof.Visible            := false;
    edtpesoi.Visible            := false;
    pgc.Visible                 := true;
    tbsrepresentante.TabVisible := true;
    tbsCliente.TabVisible       := true;
    tbscfop.TabVisible          := false;
    tbsfornecedor.TabVisible    := true;
    tbsproduto.TabVisible       := true;
    tbstpsaida.TabVisible       := true;
    tbsuf.TabVisible            := true;
    tbsrota.TabVisible          := true;
    tbsgrupo.tabvisible         := true;
  end
  else if (consulta = '412 - Sint�tico') or
          (consulta = '497 - Gerencial') or
          (consulta = '413 - Sint�tico Condicao Pagamento') or
          (consulta = '538 - Acumulado por Condi��o de Pagamento') or
          (consulta = '619 - Sint�tico Faturamento') or
          (consulta = '620 - Sint�tico Faturamento por Representante') or
          (consulta = '446 - Sint�tico Faturamento por Tipo Cobran�a') or
          (consulta = '448 - Sint�tico Faturamento por Tipo Cobran�a (quebra produto)') or
          (consulta = '449 - Sint�tico Faturamento por Tipo Cobran�a (quebra cliente)') or
          (consulta = '450 - Sint�tico Faturamento por Tipo Cobran�a (data emiss�o)') or
          (consulta = '451 - Sint�tico Faturamento por Tipo Cobran�a (produto)') or
          (consulta = '452 - Sint�tico Faturamento por Tipo Cobran�a (cliente)') then
  begin
    actGerar.Enabled            := true;
    ckbnrecebido.Visible        := false;
    tbstpcobranca.TabVisible    := True;
    lblinicial.Visible          := true;
    lblfinal.Visible            := true;
    edtdtf.Visible              := true;
    edtdti.Visible              := true;
    tbsmunicipio.TabVisible     := false;
    lblpeso.visible             := false;
    edtpesof.Visible            := false;
    edtpesoi.Visible            := false;
    pgc.Visible                 := true;
    tbsrepresentante.TabVisible := true;
    tbsCliente.TabVisible       := true;
    tbscfop.TabVisible          := false;
    tbsfornecedor.TabVisible    := true;
    tbsproduto.TabVisible       := true;
    tbstpsaida.TabVisible       := true;
    tbsuf.TabVisible            := true;
    tbsrota.TabVisible          := true;
    tbsgrupo.tabvisible         := false;
  end
  {else if //(consulta = 'Sint�tico Frete') or
  //(consulta = 'Sint�tico Frete por Cidade') or
  (consulta = 'Sint�tico Frete Porcentagem') then
  begin
    actGerar.Enabled           := true;
    ckbnrecebido.Visible        := false;
    tbstpcobranca.TabVisible    := false;
    tbsmunicipio.TabVisible     := false;
    lblinicial.Visible          := true;
    lblfinal.Visible            := true;
    edtdtf.Visible              := true;
    edtdti.Visible              := true;
    lblpeso.visible             := false;
    edtpesof.Visible            := false;
    edtpesoi.Visible            := false;
    pgc.Visible                 := true;
    tbsrepresentante.TabVisible := true;
    tbsCliente.TabVisible       := true;
    tbscfop.TabVisible          := false;
    tbsfornecedor.TabVisible    := false;
    tbsproduto.TabVisible       := true;
    tbstpsaida.TabVisible       := true;
    tbsuf.TabVisible            := true;
    tbsrota.TabVisible          := true;
  end}
  {else if consulta = 'Sint�tico ICMS' then
  begin
    actGerar.Enabled            := true;
    ckbnrecebido.Visible        := false;
    tbstpcobranca.TabVisible    := false;
    tbsmunicipio.TabVisible     := false;
    lblinicial.Visible          := true;
    lblfinal.Visible            := true;
    edtdtf.Visible              := true;
    edtdti.Visible              := true;
    lblpeso.visible             := false;
    edtpesof.Visible            := false;
    edtpesoi.Visible            := false;
    pgc.Visible                 := true;
    tbsrepresentante.TabVisible := true;
    tbsCliente.TabVisible       := true;
    tbscfop.TabVisible          := false;
    tbsfornecedor.TabVisible    := false;
    tbsproduto.TabVisible       := true;
    tbstpsaida.TabVisible       := true;
    tbsuf.TabVisible            := true;
    tbsrota.TabVisible          := false;
  end}
  {else if //(consulta = 'Di�rio ICMS') or
     (consulta = 'Mensal ICMS') //or (consulta = 'Mensal Frete') //or (consulta = 'Di�rio Frete')
        then
  begin
    actGerar.Enabled    := true;
    ckbnrecebido.Visible := false;
    tbstpcobranca.TabVisible    := false;
    tbsmunicipio.TabVisible     := false;
    lblinicial.Visible          := true;
    lblfinal.Visible            := true;
    edtdtf.Visible              := true;
    edtdti.Visible              := true;
    lblpeso.visible             := false;
    edtpesof.Visible            := false;
    edtpesoi.Visible            := false;
    tbsmunicipio.TabVisible     := false;
    pgc.Visible                 := true;
    tbsrepresentante.TabVisible := true;
    tbsCliente.TabVisible       := true;
    tbscfop.TabVisible          := false;
    tbsfornecedor.TabVisible    := false;
    tbsproduto.TabVisible       := false;
    tbstpsaida.TabVisible       := true;
    tbsuf.TabVisible            := false;
    tbsrota.tabvisible          := false;
    tbsgrupo.TabVisible         := false;
  end}
  else if consulta = '632 - Mensal por Representante' then
  begin
    actGerar.Enabled           := true;
    ckbnrecebido.Visible        := false;
    tbsserie.TabVisible         := True;
    tbstpcobranca.TabVisible    := true;
    tbsmunicipio.TabVisible     := false;
    lblinicial.Visible          := true;
    lblfinal.Visible            := true;
    edtdtf.Visible              := true;
    edtdti.Visible              := true;
    lblpeso.visible             := false;
    edtpesof.Visible            := false;
    edtpesoi.Visible            := false;
    pgc.Visible                 := true;
    tbsrepresentante.TabVisible := true;
    tbsCliente.TabVisible       := true;
    tbscfop.TabVisible          := false;
    tbsfornecedor.TabVisible    := false;
    tbsproduto.TabVisible       := false;
    tbstpsaida.TabVisible       := true;
    tbsuf.TabVisible            := false;
    tbsrota.tabvisible          := false;
  end
  else if (consulta = '608 - Di�rio') or
          //(consulta = 'Di�rio Produtos') or
          (consulta = '610 - Mensal') or
          //(consulta = 'Mensal por Tipo Documento') or
          //(consulta = 'Di�rio Frete') or
          (consulta = '609 - Di�rio Faturamento') or
          (consulta = '612 - Mensal Faturamento') or
          (consulta = '611 - Mensal Faturamento por Representante') or
          (consulta = '258 - Mensal Frete Porcentagem') or
          (consulta = '257 - Di�rio Frete Porcentagem') then
  begin
    actGerar.Enabled    := true;
    ckbnrecebido.Visible := false;
    tbsserie.TabVisible         := True;
    tbstpcobranca.TabVisible    := false;
    tbsmunicipio.TabVisible     := false;
    lblinicial.Visible          := true;
    lblfinal.Visible            := true;
    edtdtf.Visible              := true;
    edtdti.Visible              := true;
    lblpeso.visible             := false;
    edtpesof.Visible            := false;
    edtpesoi.Visible            := false;
    pgc.Visible                 := true;
    tbsrepresentante.TabVisible := true;
    tbsCliente.TabVisible       := true;
    tbscfop.TabVisible          := false;
    tbsfornecedor.TabVisible    := false;
    tbsproduto.TabVisible       := false;
    tbstpsaida.TabVisible       := true;
    tbsuf.TabVisible            := false;
    tbsrota.tabvisible          := false;
  end
  else if (consulta = '617 - Quantidade Vendida Mensal (por Representante)') or
          (consulta = '618 - Quantidade Vendida Mensal (por Uf)') or
          (consulta = 'Valor Vendido Mensal (por Representante)') or
          (consulta = 'Valor Vendido Mensal (por Uf)') or
          (consulta = 'Valor do ICMS Mensal (por Uf)') or
          (consulta = 'Valor do IPI  Mensal (por Uf)') or
          (consulta = 'Valor da base ICMS Mensal (por Uf)') or
          (consulta = 'Valor da base IPI Mensal (por Uf)') or
          (consulta = 'Valor do Frente Mensal (por Uf)') or
          (consulta = 'Valor de Comissao Mensal (por Uf)') or
          (consulta = 'Valor de Comissao Mensal (por Representante)') then
  begin
    actGerar.Enabled    := true;
    ckbnrecebido.Visible := false;
    tbstpcobranca.TabVisible    := false;
    tbsmunicipio.TabVisible     := false;
    lblinicial.Visible          := true;
    lblfinal.Visible            := true;
    edtdtf.Visible              := true;
    edtdti.Visible              := true;
    lblpeso.visible             := false;
    edtpesof.Visible            := false;
    edtpesoi.Visible            := false;
    pgc.Visible                 := true;
    tbsrepresentante.TabVisible := true;
    tbsCliente.TabVisible       := false;
    tbscfop.TabVisible          := false;
    tbsfornecedor.TabVisible    := false;
    tbsproduto.TabVisible       := true;
    tbstpsaida.TabVisible       := true;
    tbsuf.TabVisible            := true;
    tbsrota.tabvisible          := true;
    tbsgrupo.tabvisible         := false;
  end;
  aplicarconfiguracaoempresa;
end;

procedure TfrmConsultaSaida.actsalvarExecute(Sender: TObject);
begin
  SalvarArquivo(mem);
end;

procedure TfrmConsultaSaida.edtnmufChange(Sender: TObject);
begin
  preencherNomeListview(TEdit(sender), executar_on_change_uf);
end;

procedure TfrmConsultaSaida.edtnmufKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  AdicionarNomeListView(lsvuf, executar_on_change_uf, tedit(sender), key);
end;

procedure TfrmConsultaSaida.edtnmrepresentanteChange(Sender: TObject);
begin
  preencherNomeListview(TEdit(sender), executar_on_change_representante);
end;

procedure TfrmConsultaSaida.edtnmrepresentanteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  AdicionarNomeListView(lsvrepresentante, executar_on_change_representante, tedit(sender), key);
end;

procedure TfrmConsultaSaida.edtnmclienteChange(Sender: TObject);
begin
  preencherNomeListview(TEdit(sender), executar_on_change_cliente);
end;

procedure TfrmConsultaSaida.edtnmclienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  AdicionarNomeListView(lsvcliente, executar_on_change_cliente, tedit(sender), key);
end;

procedure TfrmConsultaSaida.ToolButton17Click(Sender: TObject);
begin
  AdicionarListView(lsvproduto);
end;

procedure TfrmConsultaSaida.ToolButton28Click(Sender: TObject);
begin
  AdicionarListView(lsvtpsaida);
end;

procedure TfrmConsultaSaida.ToolButton18Click(Sender: TObject);
begin
  ExcluirListView(lsvproduto);
end;

procedure TfrmConsultaSaida.ToolButton29Click(Sender: TObject);
begin
  ExcluirListView(lsvtpsaida);
end;

procedure TfrmConsultaSaida.ToolButton20Click(Sender: TObject);
begin
  lsvproduto.Clear;
end;

procedure TfrmConsultaSaida.ToolButton31Click(Sender: TObject);
begin
  lsvtpsaida.Clear;
end;

procedure TfrmConsultaSaida.edtnmprodutoChange(Sender: TObject);
begin
  preencherNomeListview(TEdit(sender), executar_on_change_produto);
end;

procedure TfrmConsultaSaida.edtnmtpsaidaChange(Sender: TObject);
begin
  preencherNomeListview(TEdit(sender), executar_on_change_tpsaida);
end;

procedure TfrmConsultaSaida.edtnmprodutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  AdicionarNomeListView(lsvproduto, executar_on_change_produto, tedit(sender), key);
end;

procedure TfrmConsultaSaida.edtnmtpsaidaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  AdicionarNomeListView(lsvtpsaida, executar_on_change_tpsaida, tedit(sender), key);
end;

procedure TfrmConsultaSaida.edtcdrepresentanteKeyPress(Sender: TObject; var Key: Char);
begin
  AdicionarCodigoListView(lsvrepresentante, TEdit(sender), key);
end;

procedure TfrmConsultaSaida.edtcdufKeyPress(Sender: TObject; var Key: Char);
begin
  AdicionarCodigoListView(lsvuf, TEdit(sender), key);
end;

procedure TfrmConsultaSaida.edtcdprodutoKeyPress(Sender: TObject; var Key: Char);
begin
  AdicionarCodigoListView(lsvproduto, TEdit(sender), key);
end;

procedure TfrmConsultaSaida.edtcdtpsaidaKeyPress(Sender: TObject; var Key: Char);
begin
  AdicionarCodigoListView(lsvtpsaida, TEdit(sender), key);
end;

procedure TfrmConsultaSaida.ToolButton32Click(Sender: TObject);
begin
  AdicionarListView(lsvgrupo);
end;

procedure TfrmConsultaSaida.ToolButton33Click(Sender: TObject);
begin
  ExcluirListView(lsvgrupo);
end;

procedure TfrmConsultaSaida.ToolButton35Click(Sender: TObject);
begin
  lsvGrupo.Clear;
end;

procedure TfrmConsultaSaida.edtcdgrupoKeyPress(Sender: TObject; var Key: Char);
begin
  AdicionarCodigoListView(lsvgrupo, TEdit(sender), key);
end;

procedure TfrmConsultaSaida.edtnmgrupoChange(Sender: TObject);
begin
  preencherNomeListview(TEdit(sender), executar_on_change_grupo);
end;

procedure TfrmConsultaSaida.edtnmgrupoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  AdicionarNomeListView(lsvGrupo, executar_on_change_Grupo, tedit(sender), key);
end;

procedure TfrmConsultaSaida.ToolButton36Click(Sender: TObject);
begin
  AdicionarListView(lsvrota);
end;

procedure TfrmConsultaSaida.ToolButton37Click(Sender: TObject);
begin
  ExcluirListView(lsvrota);
end;

procedure TfrmConsultaSaida.ToolButton39Click(Sender: TObject);
begin
  lsvRota.Clear;
end;

procedure TfrmConsultaSaida.edtcdrotaKeyPress(Sender: TObject; var Key: Char);
begin
  AdicionarCodigoListView(lsvRota, TEdit(sender), key);
end;

procedure TfrmConsultaSaida.edtnmrotaChange(Sender: TObject);
begin
  preencherNomeListview(TEdit(sender), executar_on_change_Rota);
end;

procedure TfrmConsultaSaida.edtnmrotaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  AdicionarNomeListView(lsvRota, executar_on_change_Rota, tedit(sender), key);
end;

procedure TfrmConsultaSaida.ToolButton40Click(Sender: TObject);
begin
  AdicionarListView(lsvfornecedor);
end;

procedure TfrmConsultaSaida.ToolButton41Click(Sender: TObject);
begin
  ExcluirListView(lsvfornecedor);
end;

procedure TfrmConsultaSaida.ToolButton43Click(Sender: TObject);
begin
  lsvFornecedor.Clear;
end;

procedure TfrmConsultaSaida.edtnmfornecedorChange(Sender: TObject);
begin
  preencherNomeListview(TEdit(sender), executar_on_change_Fornecedor);
end;

procedure TfrmConsultaSaida.edtnmfornecedorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  AdicionarNomeListView(lsvFornecedor, executar_on_change_Fornecedor, tedit(sender), key);
end;

procedure TfrmConsultaSaida.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TfrmConsultaSaida.actfecharExecute(Sender: TObject);
begin
  close;
  frmmain.main.DestruirBotaoFormAtual(lowercase(copy(self.Name, 4, length(self.Name) - 3)), frmmain.tlbnew);
end;

procedure TfrmConsultaSaida.FormDestroy(Sender: TObject);
begin
  saida.free;
end;

procedure TfrmConsultaSaida.ntbPageChanged(Sender: TObject);
begin
  actsalvar.Visible   := ntb.ActivePage = 'texto';
end;

procedure TfrmConsultaSaida.edtcdclienteKeyPress(Sender: TObject; var Key: Char);
var
  ListItem: TListItem;
  cdcliente : string;
  i : integer;
begin
  if key <> #13 then
  begin
    Exit;
  end;
  if not codigoexiste(_cliente, edtcdcliente.text) then
  begin
    exit;
  end;
  cdcliente := edtcdcliente.text;
  edtcdcliente.Clear;
  edtcdcliente.SetFocus;
  for i := 0 to lsvcliente.Items.Count - 1 do
  begin
    if lsvcliente.Items.Item[i].Caption = cdcliente then
    begin
      exit;
    end;
  end;
  ListItem         := lsvcliente.Items.Add;
  ListItem.Caption := cdcliente;
  ListItem.SubItems.Add(NomedoCodigo(_cliente, cdcliente));
end;

procedure TfrmConsultaSaida.edtcdfornecedorKeyPress(Sender: TObject; var Key: Char);
var
  ListItem: TListItem;
  cdFornecedor : string;
  i : integer;
begin
  if key <> #13 then
  begin
    Exit;
  end;
  if not codigoexiste(_Fornecedor, edtcdFornecedor.text) then
  begin
    exit;
  end;
  cdFornecedor := edtcdFornecedor.text;
  edtcdFornecedor.Clear;
  if cdFornecedor <> '' then
  begin
    edtcdFornecedor.SetFocus;
    for i := 0 to lsvFornecedor.Items.Count - 1 do
    begin
      if lsvFornecedor.Items.Item[i].Caption = cdFornecedor then
      begin
        exit;
      end;
    end;
    ListItem         := lsvFornecedor.Items.Add;
    ListItem.Caption := cdFornecedor;
    ListItem.SubItems.Add(NomedoCodigo(_Fornecedor, cdFornecedor));
  end;
end;

procedure TfrmConsultaSaida.ToolButton3Click(Sender: TObject);
begin
  AdicionarListView(lsvcondpagto);
end;

procedure TfrmConsultaSaida.ToolButton6Click(Sender: TObject);
begin
  ExcluirListView(lsvcondpagto);
end;

procedure TfrmConsultaSaida.ToolButton11Click(Sender: TObject);
begin
  lsvcondpagto.Clear;
end;

procedure TfrmConsultaSaida.edtcdcondpagtoKeyPress(Sender: TObject; var Key: Char);
begin
  AdicionarCodigoListView(lsvcondpagto, TEdit(sender), key);
end;

procedure TfrmConsultaSaida.edtnmcondpagtoChange(Sender: TObject);
begin
  preencherNomeListview(TEdit(sender), executar_on_change_condpagto);
end;

procedure TfrmConsultaSaida.edtnmcondpagtoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  AdicionarNomeListView(lsvcondpagto, executar_on_change_condpagto, tedit(sender), key);
end;

procedure TfrmConsultaSaida.FormCreate(Sender: TObject);
begin
  bloco := TInstrucaoSQL.create(self);
  set_treeview;
end;

procedure TfrmConsultaSaida.ToolButton15Click(Sender: TObject);
begin
  AdicionarListView(lsvtpcobranca);
end;

procedure TfrmConsultaSaida.ToolButton19Click(Sender: TObject);
begin
  ExcluirListView(lsvtpcobranca);
end;

procedure TfrmConsultaSaida.ToolButton23Click(Sender: TObject);
begin
  lsvtpcobranca.Clear;
end;

procedure TfrmConsultaSaida.edtcdtpcobrancaKeyPress(Sender: TObject; var Key: Char);
begin
  AdicionarCodigoListView(lsvtpcobranca, TEdit(sender), key);
end;

procedure TfrmConsultaSaida.edtnmtpcobrancaChange(Sender: TObject);
begin
  preencherNomeListview(TEdit(sender), executar_on_change_tpcobranca);
end;

procedure TfrmConsultaSaida.edtnmtpcobrancaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  AdicionarNomeListView(lsvtpcobranca, executar_on_change_tpcobranca, tedit(sender), key);
end;

procedure TfrmConsultaSaida.ToolButton4Click(Sender: TObject);
begin
  AdicionarListView(lsvmunicipio);
end;

procedure TfrmConsultaSaida.ToolButton5Click(Sender: TObject);
begin
  ExcluirListView(lsvmunicipio);
end;

procedure TfrmConsultaSaida.ToolButton38Click(Sender: TObject);
begin
  lsvmunicipio.Clear;
end;

procedure TfrmConsultaSaida.edtcdmunicipioKeyPress(Sender: TObject; var Key: Char);
begin
  AdicionarCodigoListView(lsvmunicipio, TEdit(sender), key);
end;

procedure TfrmConsultaSaida.edtnmmunicipioChange(Sender: TObject);
begin
  preencherNomeListview(TEdit(sender), executar_on_change_municipio);
end;

procedure TfrmConsultaSaida.edtnmmunicipioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  AdicionarNomeListView(lsvmunicipio, executar_on_change_municipio, tedit(sender), key);
end;

procedure TfrmConsultaSaida.ToolButton7Click(Sender: TObject);
begin
  AdicionarListView(lsvcfop);
end;

procedure TfrmConsultaSaida.ToolButton13Click(Sender: TObject);
begin
  ExcluirListView(lsvcfop);
end;

procedure TfrmConsultaSaida.ToolButton14Click(Sender: TObject);
begin
  lsvcfop.Clear;
end;

procedure TfrmConsultaSaida.edtcdcfopKeyPress(Sender: TObject; var Key: Char);
begin
  AdicionarCodigoListView(lsvcfop, TEdit(sender), key);
end;

procedure TfrmConsultaSaida.edtnmcfopChange(Sender: TObject);
begin
  preencherNomeListview(TEdit(sender), executar_on_change_cfop);
end;

procedure TfrmConsultaSaida.edtnmcfopKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  AdicionarNomeListView(lsvcfop, executar_on_change_cfop, tedit(sender), key);
end;

procedure TfrmConsultaSaida.ToolButton16Click(Sender: TObject);
begin
  AdicionarListView(lsvstdocumento);
end;

procedure TfrmConsultaSaida.ToolButton25Click(Sender: TObject);
begin
  ExcluirListView(lsvstdocumento);
end;

procedure TfrmConsultaSaida.ToolButton26Click(Sender: TObject);
begin
  lsvstdocumento.Clear;
end;

procedure TfrmConsultaSaida.edtnustdocumentoKeyPress(Sender: TObject; var Key: Char);
begin
  AdicionarCodigoListView(lsvstdocumento, TEdit(sender), key);
end;

procedure TfrmConsultaSaida.edtnmstdocumentoChange(Sender: TObject);
begin
  preencherNomeListview(TEdit(sender), executar_on_change_stdocumento);
end;

procedure TfrmConsultaSaida.edtnmstdocumentoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  AdicionarNomeListView(lsvstdocumento, executar_on_change_stdocumento, tedit(sender), key);
end;

procedure TfrmConsultaSaida.ToolButton27Click(Sender: TObject);
begin
  AdicionarListView(lsvserie);
end;

procedure TfrmConsultaSaida.ToolButton30Click(Sender: TObject);
begin
  ExcluirListView(lsvserie);
end;

procedure TfrmConsultaSaida.ToolButton34Click(Sender: TObject);
begin
  lsvserie.Clear;
end;

procedure TfrmConsultaSaida.edtnmserieChange(Sender: TObject);
begin
  preencherNomeListview(TEdit(sender), executar_on_change_serie);
end;

procedure TfrmConsultaSaida.edtnmserieKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  AdicionarNomeListView(lsvserie, executar_on_change_serie, tedit(sender), key);
end;

procedure TfrmConsultaSaida.edtcdserieKeyPress(Sender: TObject; var Key: Char);
begin
  AdicionarCodigoListView(lsvserie, TEdit(sender), key);
end;

procedure TfrmConsultaSaida.set_treeview;
var
  no1 : TTreeNode;
begin
  no1 := trv.Items.AddChild(nil, qstring.maiuscula(__relatorio));
  trv.Items.AddChild(no1, '308 - Acompanhamento de Vendas');
  trv.Items.AddChild(no1, '308 - Acompanhamento de Vendas Anual');
  trv.Items.AddChild(no1, '308 - Acompanhamento de Vendas Mensal');
  trv.Items.AddChild(no1, '538 - Acumulado por Condi��o de Pagamento');
  trv.Items.AddChild(no1, '354 - Anal�tico');
  trv.Items.AddChild(no1, '355 - Anal�tico Faturamento');
  trv.Items.AddChild(no1, '364 - Aproveitamento Cr�dito PIS e COFINS');
  trv.Items.AddChild(no1, '363 - Apura��o de PIS e COFINS');
  //trv.Items.AddChild(no1, 'D�bito ICMS');
  //trv.Items.AddChild(no1, 'D�bito ICMS Substitui��o Tribut�ria');
  //trv.Items.AddChild(no1, 'D�bito IPI');
  trv.Items.AddChild(no1, '608 - Di�rio');
  trv.Items.AddChild(no1, '609 - Di�rio Faturamento');
  //trv.Items.AddChild(no1, 'Di�rio Frete');
  trv.Items.AddChild(no1, '257 - Di�rio Frete Porcentagem');
  //trv.Items.AddChild(no1, 'Di�rio ICMS');
  //trv.Items.AddChild(no1, 'Di�rio Produtos');
  trv.Items.AddChild(no1, '497 - Gerencial');
  trv.Items.AddChild(no1, '562 - Grupo de Produtos por Representante');
  //trv.Items.AddChild(no1, 'ICMS/Frete por Estado Mensal');
  trv.Items.AddChild(no1, 'ICMS por Estado Mensal');
  //trv.Items.AddChild(no1, 'Imposto de Notas Fiscais');
  trv.Items.AddChild(no1, '610 - Mensal');
  trv.Items.AddChild(no1, '612 - Mensal Faturamento');
  trv.Items.AddChild(no1, '611 - Mensal Faturamento por Representante');
  trv.Items.AddChild(no1, '258 - Mensal Frete Porcentagem');
  //trv.Items.AddChild(no1, 'Mensal Frete');
  //trv.Items.AddChild(no1, 'Mensal ICMS');
  //trv.Items.AddChild(no1, 'Mensal por Estado');
  trv.Items.AddChild(no1, '613 - Mensal por Cliente (Quebra M�s)');
  trv.Items.AddChild(no1, '614 - Mensal por Cliente (Quebra Cliente)');
  trv.Items.AddChild(no1, '615 - Mensal por Produto (Quebra M�s)');
  trv.Items.AddChild(no1, '616 - Mensal por Produto (Quebra Produto)');
  //trv.Items.AddChild(no1, 'Mensal por Tipo Documento');
  trv.Items.AddChild(no1, '632 - Mensal por Representante');
  //trv.Items.AddChild(no1, 'por Estado');
  //trv.Items.AddChild(no1, 'Pre�o M�dio Venda Produto');
  //trv.Items.AddChild(no1, 'Pre�o M�dio Venda Produto (ICMS 07%/12%/18%)');
  trv.Items.AddChild(no1, '602 - Produtos por Representante');
  trv.Items.AddChild(no1, '617 - Quantidade Vendida Mensal (por Representante)');
  trv.Items.AddChild(no1, '618 - Quantidade Vendida Mensal (por Uf)');
  trv.Items.AddChild(no1, '412 - Sint�tico');
  trv.Items.AddChild(no1, '426 - Sint�tico CFOP');
  trv.Items.AddChild(no1, '33 - Sint�tico Documento Fiscal ICMS');
  trv.Items.AddChild(no1, '34 - Sint�tico Situa��o Tribut�ria do PIS');
  trv.Items.AddChild(no1, '35 - Sint�tico Situa��o Tribut�ria do ICMS');
  trv.Items.AddChild(no1, '413 - Sint�tico Condicao Pagamento');
  trv.Items.AddChild(no1, '619 - Sint�tico Faturamento');
  trv.Items.AddChild(no1, '620 - Sint�tico Faturamento por Representante');
  trv.Items.AddChild(no1, '446 - Sint�tico Faturamento por Tipo Cobran�a');
  trv.Items.AddChild(no1, '448 - Sint�tico Faturamento por Tipo Cobran�a (quebra produto)');
  trv.Items.AddChild(no1, '449 - Sint�tico Faturamento por Tipo Cobran�a (quebra cliente)');
  trv.Items.AddChild(no1, '450 - Sint�tico Faturamento por Tipo Cobran�a (data emiss�o)');
  trv.Items.AddChild(no1, '451 - Sint�tico Faturamento por Tipo Cobran�a (produto)');
  trv.Items.AddChild(no1, '452 - Sint�tico Faturamento por Tipo Cobran�a (cliente)');
  //trv.Items.AddChild(no1, 'Sint�tico Frete');
  //trv.Items.AddChild(no1, 'Sint�tico Frete por Cidade');
  //trv.Items.AddChild(no1, 'Sint�tico Frete Porcentagem');
  trv.Items.AddChild(no1, 'Sint�tico ICMS');
  trv.Items.AddChild(no1, '311 - Sint�tico ISS');
  trv.Items.AddChild(no1, '573 - Sint�tico Lucro de Produto');
  trv.Items.AddChild(no1, '601 - Sint�tico Lucro de Produto pelo Custo M�dio');
  trv.Items.AddChild(no1, '496 - Sint�tico NCM');
  trv.Items.AddChild(no1, '348 - Sint�tico PIS e COFINS');
  trv.Items.AddChild(no1, '621 - Valor Frete Mensal');
  trv.Items.AddChild(no1, '622 - Valor Frete Mensal por Estado');
  trv.Items.AddChild(no1, 'Valor Vendido Mensal (por Produto)');
  trv.Items.AddChild(no1, 'Valor Vendido Mensal (por Representante)');
  trv.Items.AddChild(no1, 'Valor Vendido Mensal (por Uf)');
  trv.Items.AddChild(no1, 'Valor do ICMS Mensal (por Uf)');
  trv.Items.AddChild(no1, 'Valor do IPI  Mensal (por Uf)');
  trv.Items.AddChild(no1, 'Valor da base ICMS Mensal (por Uf)');
  trv.Items.AddChild(no1, 'Valor da base IPI Mensal (por Uf)');
  trv.Items.AddChild(no1, 'Valor do Frente Mensal (por Uf)');
  trv.Items.AddChild(no1, 'Valor de Comissao Mensal (por Uf)');
  trv.Items.AddChild(no1, 'Valor de Comissao Mensal (por Representante)');
  no1 := trv.Items.AddChild(nil, qstring.maiuscula(__funcao));
  trv.Items.AddChild(no1, 'Entrada Estoque Produto Acabado para Livro Produ��o');
  trv.Items.AddChild(no1, 'Gerar contas a receber');
  trv.Items.AddChild(no1, 'Recalcular Comiss�o');
  trv.Items.AddChild(no1, 'Recalcular PIS/COFINS');
end;

end.
