unit Gerenciador.Gerenciador;

interface

uses
  System.Actions, System.UITypes,
  forms, Menus, ActnList, ImgList, Controls, Classes, ComCtrls, ToolWin, graphics,
  windows, sysutils, types, dialogs, ExtCtrls, Gauges,
  Data.DB,
  dialogo.exportarexcel, uconstantes, rotina.strings, rotina.registro,
  rotina.retornasql, classe.form, classe.gerar, classe.executasql, classe.registrainformacao,
  orm.cntcusto, orm.empresa, classe.aplicacao, classe.query,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxBar, cxClasses,
  cxContainer, cxEdit, cxTreeView, cxPCdxBarPopupMenu, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC,
  cxSplitter, cxDBLookupComboBox, cxCurrencyEdit, cxCalendar, cxBarEditItem,
  cxNavigator, dxBarBuiltInMenu;

type
  TfrmManager = class(TForm)
    act: TActionList;
    pnl: TPanel;
    actatualizar: TAction;
    pumtreeview: TPopupMenu;
    actnovo: TAction;
    Novo1: TMenuItem;
    actexcluir: TAction;
    Excluir1: TMenuItem;
    actfechar: TAction;
    actrenomear: TAction;
    Renomear2: TMenuItem;
    bmg1: TdxBarManager;
    dxbrManager1Bar: TdxBar;
    dxbrManager1Bar1: TdxBar;
    dxbrsbtmRegistro: TdxBarSubItem;
    dxbrlrgbtnNovo: TdxBarLargeButton;
    dxbrlrgbtnexcluir: TdxBarLargeButton;
    dxbrlrgbtnfechar: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    trv: TcxTreeView;
    bmg1Bar1: TdxBar;
    actrecortar: TAction;
    actcolar: TAction;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    acttransferir: TAction;
    actpropriedades: TAction;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    procedure trvDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure actatualizarExecute(Sender: TObject);
    procedure actnovoExecute(Sender: TObject);
    procedure actexcluirExecute(Sender: TObject);
    procedure trvChange(Sender: TObject; Node: TTreeNode);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pumtreeviewPopup(Sender: TObject);
    procedure actfecharExecute(Sender: TObject);
    procedure actrenomearExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actrecortarExecute(Sender: TObject);
    procedure actcolarExecute(Sender: TObject);
    procedure actExecute(Action: TBasicAction; var Handled: Boolean);
    procedure acttransferirExecute(Sender: TObject);
    procedure actpropriedadesExecute(Sender: TObject);
  private    { Private declarations }
    posicao : array of integer;
    tamanho : array of integer;
    vCodigoRecortar : integer;
    exibe : string;
    function  Atualizar:boolean;
    function  nivelregistro(no: ttreenode):Integer;
    function  NivelTabela(nunivel, nome:string; nivel:integer):string;
    function  InserirRegistro(nome:string; cdpai:integer=0):integer;
    //function  GetNunivel(cdpai:integer):string;
    function  codigo_do_mesmo_nivel(codigo_recortar, codigo_colar:integer):boolean;
    procedure RecortarNivel(codigo_recortar, codigo_colar:integer);
    procedure setacao;
    procedure AdicionarProximoNivel(gau: TGauge; no: TTreeNode; nivel: integer; cdgrupo: string);
    function adicionarproximonivel1(no2: ttreenode): string;
    function transferir_registro(codigo_origem, codigo_destino: integer): boolean;
    procedure inserir_sub_nivel(codigopai, codigodestino: integer);
  public     { Public declarations }
    tbl : string;
  end;

var
  frmManagerplconta: TfrmManager;
  frmManagercntcusto: TfrmManager;

implementation

uses uMain, uDtmMain, dialogo.ProgressBar, Variants, orm.movbancario, orm.plconta, ulocalizar, financeiro.plconta;

{$R *.DFM}

function TfrmManager.InserirRegistro(nome:string; cdpai:integer=0):integer;
begin
  if tbl = _plconta then
  begin
    result := tplconta.Inserir(nome, cdpai);
  end
  else
  begin
    result := tcntcusto.Inserir(nome, cdpai);
  end;
end;

function TfrmManager.NivelTabela(nunivel, nome:string; nivel:integer):string;
begin
  result := copy(nunivel, posicao[nivel], tamanho[nivel]) + ' - '+nome;
end;

procedure TfrmManager.AdicionarProximoNivel(gau: TGauge; no:TTreeNode; nivel:integer; cdgrupo:string);
var
  q : TClasseQuery;
  no2 : TTreeNode;
  texto : string;
begin
  q := TClasseQuery.create(StringParametro('select cd'+tbl+',nm'+tbl+',nunivel,cd'+tbl+'pai from '+tbl+' where cdempresa='+empresa.cdempresa.tostring+' and cd'+tbl+'pai=:cd'+tbl+' order by nunivel', cdgrupo));
  try
    while not q.q.eof do
    begin
      gau.Progress := gau.Progress + 1;
      application.ProcessMessages;
      if gau.Progress = 100 then
      begin
        gau.Progress := 0;
      end;
      texto := niveltabela(q.q.fields[2].asstring, q.q.fields[1].asstring, nivel);
      no2   := trv.Items.AddChild(no, texto);
      AdicionarProximoNivel(gau, no2, nivel + 1, q.q.fieldbyname(_cd+tbl).asstring);
      q.q.next;
    end;
  finally
    freeandnil(q);
  end;
end;

function TfrmManager.Atualizar:boolean;
var
  q : TClasseQuery;
  no : TTreeNode;
  function nome_grupo_treeview:string;
  begin
    result := q.q.fields[2].asstring+' - '+q.q.fields[1].asstring;
  end;
begin
  trv.items.Clear;
  q  := TClasseQuery.create('select cd'+tbl+
                                  ',nm'+tbl+
                                  ',nunivel'+
                                  ',cd'+tbl+'pai '+
                            'from '+tbl+' '+
                            'where cdempresa='+empresa.cdempresa.tostring+' and cd'+tbl+'pai is null '+
                            'order by nunivel');
  frmprogressbar := tfrmprogressbar.create(nil);
  try
    trv.Items.Add(nil, exibe);
    trv.Items[0];
    frmprogressbar.gau.maxvalue := 100;
    frmprogressbar.show;
    while not q.q.eof do
    begin
      frmprogressbar.gau.Progress := frmprogressbar.gau.Progress + 1;
      application.ProcessMessages;
      if frmprogressbar.gau.Progress = 100 then
      begin
        frmprogressbar.gau.Progress := 0;
      end;
      no := trv.Items.AddChild(trv.Items[0], nome_grupo_treeview);
      adicionarproximonivel(frmprogressbar.gau, no, 1, q.q.fieldbyname(_cd+tbl).AsString);
      q.q.next;
    end;
    result := true;
  finally
    freeandnil(q);
    freeandnil(frmprogressbar);
  end;
end;

function TfrmManager.adicionarproximonivel1(no2:ttreenode):string;
var
  nunivel:string;
  posicao : integer;
begin
  nunivel := no2.Text;
  posicao := pos('-', nunivel);
  nunivel := copy(nunivel, 1, posicao -2);
  if no2.Level <= 1 then
  begin
    result := nunivel
  end
  else
  begin
    result := adicionarproximonivel1(no2.Parent)+'.'+nunivel;
  end;
end;

function TfrmManager.nivelregistro(no:ttreenode):Integer;
begin
  result := qregistro.CodigodoString(tbl, adicionarproximonivel1(no), _nunivel);
end;

procedure TfrmManager.trvDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := true;
end;

procedure TfrmManager.actatualizarExecute(Sender: TObject);
begin
  atualizar;
end;

procedure TfrmManager.actnovoExecute(Sender: TObject);
var
  texto, nome : string;
  codigo : integer;
begin
  nome := Trim(RetiraAcentos(uppercase(inputbox('Nome do '+exibe, 'Digite o nome do '+exibe, ''))));
  if nome = '' then
  begin
    exit;
  end;
  if trv.Selected.Level = 0 then
  begin
    codigo := 0
  end
  else
  begin
    codigo := nivelregistro(trv.selected);
  end;
  codigo := InserirRegistro(nome, codigo);
  texto  := NivelTabela(qregistro.stringdocodigo(tbl, codigo, _nunivel), qregistro.nomedocodigo(tbl, codigo), trv.Selected.Level);
  trv.Items.AddChild(trv.Selected, texto);
  refresh;
end;

procedure TfrmManager.actpropriedadesExecute(Sender: TObject);
var
  codigo : integer;
begin
  codigo := nivelregistro(trv.selected);
  dlgPlconta(codigo);
end;

procedure TfrmManager.actexcluirExecute(Sender: TObject);
var
  codigo : integer;
  plconta : tplconta;
  cntcusto : tcntcusto;
begin
  codigo := nivelregistro(trv.selected);
  if codigo = 0 then
  begin
    Exit;
  end;
  if tbl = _plconta then
  begin
    plconta := tplconta.create;
    try
      plconta.select(codigo);
      if plconta.Delete = '' then
      begin
        messagedlg('Não foi possível excluir o '+exibe+' '+plconta.cdplconta.tostring+' - '+plconta.nmplconta, mtinformation, [mbok], 0);
        exit;
      end;
      tplconta.DesativarBloqueio(plconta.cdplcontapai);
      trv.Items.Delete(trv.Selected);
    finally
      freeandnil(plconta);
    end;
  end
  else if tbl = _cntcusto then
  begin
    cntcusto := tcntcusto.create;
    try
      cntcusto.select(codigo);
      if cntcusto.Delete = '' then
      begin
        messagedlg('Não foi possível excluir o '+exibe+' '+cntcusto.cdcntcusto.tostring+' - '+cntcusto.nmcntcusto, mtinformation, [mbok], 0);
        exit;
      end;
      tcntcusto.DesativarBloqueio(cntcusto.cdcntcustopai);
      trv.Items.Delete(trv.Selected);
    finally
      freeandnil(cntcusto);
    end;
  end;
end;

procedure TfrmManager.trvChange(Sender: TObject; Node: TTreeNode);
begin
  setacao;
end;

procedure TfrmManager.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TfrmManager.pumtreeviewPopup(Sender: TObject);
begin
  setacao;
end;

procedure TfrmManager.actfecharExecute(Sender: TObject);
begin
  close;
  frmmain.main.DestruirBotaoFormAtual('manager'+tbl, frmmain.tlbnew);
end;

procedure TfrmManager.actExecute(Action: TBasicAction; var Handled: Boolean);
begin
  dtmmain.LogSiteAction(self.Name, action.Name);
end;

procedure TfrmManager.setacao;
begin
  actnovo.Visible         := not (trv.selected.level = high(posicao)+1);
  actexcluir.Visible      := not (trv.selected.level = 0);
  actrenomear.Visible     := actexcluir.Visible;
  acttransferir.Visible   := actexcluir.Visible;
  actrecortar.Visible     := actexcluir.Visible;
  actpropriedades.Visible := actexcluir.Visible;
end;

procedure TfrmManager.actrenomearExecute(Sender: TObject);
var
  nome : string;
  codigo : integer;
begin
  codigo := nivelregistro(trv.selected);
  nome   := InputBox('Renomear', 'Digite o novo nome', qregistro.nomedocodigo(tbl, codigo));
  if nome <> '' then
  begin
    nome := uppercase(RetiraAcentos(nome));
    ExecutaSQL('update '+tbl+' set nm'+tbl+'='+quotedstr(nome)+' where cdempresa='+empresa.cdempresa.tostring+' and cd'+tbl+'='+codigo.tostring);
    trv.Selected.Text := copy(trv.Selected.Text, 1, pos('-', trv.Selected.Text) - 2) + ' - '+nome;
  end;
end;

procedure TfrmManager.acttransferirExecute(Sender: TObject);
var
  cd : string;
  cdplcontadestino, cdplcontaorigem : integer;
begin
  if tbl = _plconta  then
  begin
    cdplcontaorigem := nivelregistro(trv.selected);
    // verificar o nível
    // abrir o localizar para selecionar
    cd := ulocalizar.Localizar( _plconta, _nunivel, _nmplconta, 'Plano Conta', 'o', _nunivel);
    if cd = '' then
    begin
      exit;
    end;
    cdplcontadestino := qregistro.CodigodoString(_plconta, cd, _nunivel);
    if tplconta.Transferir(cdplcontaorigem, cdplcontadestino) then
    begin
      messagedlg('Transferência realizada.', mtinformation, [mbok], 0);
    end;
  end;
end;

procedure TfrmManager.FormShow(Sender: TObject);
begin
  exibe       := NomedoCodigo(_tabela, qregistro.CodigodoNome(_tabela, UpperCase(tbl)), _nm+_exibe);
  pnl.Caption := exibe;
  setlength(posicao, empresa.get_ponto_maskara(tbl));
  setlength(tamanho, empresa.get_ponto_maskara(tbl));
  empresa.set_ponto_maskara(tbl, posicao, tamanho);
  actatualizarExecute(self);
end;

procedure TfrmManager.actrecortarExecute(Sender: TObject);
begin
  vCodigoRecortar := nivelregistro(trv.selected);
  actcolar.Enabled := True;
  actcolar.Visible := True;
end;

procedure TfrmManager.actcolarExecute(Sender: TObject);
var
  codigo_colar : integer;
begin
  codigo_colar := nivelregistro(trv.selected);
  if tbl = _plconta then
  begin
    tplconta.recortar(vcodigorecortar, codigo_colar);
    actcolar.Enabled := False;
    actcolar.Visible := False;
    vCodigoRecortar := 0;
    atualizar;
    exit;
  end;
  if not codigo_do_mesmo_nivel(vCodigoRecortar, codigo_colar) then
  begin
    MessageDlg('Selecione somente um nível acima do copiado para colar.', mtInformation, [mbOK], 0);
    Abort;
  end;
  RecortarNivel(vCodigoRecortar, codigo_colar);
  actcolar.Enabled := False;
  actcolar.Visible := False;
  vCodigoRecortar := 0;
end;

function TfrmManager.codigo_do_mesmo_nivel(codigo_recortar, codigo_colar:integer): boolean;
var
  nivel1, nivel2 : string;
begin
  nivel1 := qregistro.stringdoCodigo(tbl, codigo_recortar, _nunivel);
  nivel2 := qregistro.stringdoCodigo(tbl, codigo_colar, _nunivel);
  result := Length(nivel1) > Length(nivel2);  
end;

function TfrmManager.transferir_registro(codigo_origem, codigo_destino:integer):boolean;
  function nulo_codigo(tabela:string):string;
  begin
    Result := 'update '+tabela+' set cd'+tbl+'='+codigo_destino.tostring+' where cdempresa='+empresa.cdempresa.tostring+' and cd'+tbl+'='+codigo_origem.tostring+';';
  end;
var
  sql : TStrings;
begin
  sql := TStringList.Create;
  try
    sql.Add(nulo_codigo(_autpagto));
    sql.Add(nulo_codigo(_duplicata));
    sql.Add(nulo_codigo(_entrada));
    sql.Add(nulo_codigo(_saida));
    sql.Add(nulo_codigo(_produto));
    sql.Add('update itordcompra set cd'+tbl+'='+codigo_destino.tostring+',NU'+tbl+'='+quotedstr(qregistro.StringdoCodigo(tbl, codigo_destino, _nunivel))+' where cdempresa='+empresa.cdempresa.tostring+' and cd'+tbl+'='+codigo_origem.tostring+';');
    sql.Add('update itentrada set cd'+tbl+'='+codigo_destino.tostring+',NU'+tbl+'='+quotedstr(qregistro.StringdoCodigo(tbl, codigo_destino, _nunivel))+' where cdempresa='+empresa.cdempresa.tostring+' and cd'+tbl+'='+codigo_origem.tostring+';');
    sql.Add('update itsaida set cd'+tbl+'='+codigo_destino.tostring+',NU'+tbl+'='+quotedstr(qregistro.StringdoCodigo(tbl, codigo_destino, _nunivel))+' where cdempresa='+empresa.cdempresa.tostring+' and cd'+tbl+'='+codigo_origem.tostring+';');
    if tbl = _cntcusto then
    begin
      sql.Add(nulo_codigo(_funcionario));
      sql.Add(nulo_codigo(_itmovto));
      sql.Add(nulo_codigo(_itordcompra));
      sql.Add(nulo_codigo(_itsaida));
      sql.Add(nulo_codigo(_ordcompra));
      sql.Add(nulo_codigo(_pedidomaterial));
      sql.Add(nulo_codigo(_rim));
      sql.Add(nulo_codigo(_solicitacao));
      sql.Add(nulo_codigo(_itpedidomaterial));
      sql.Add('update ordcompra set cd'+tbl+'entrega='+codigo_destino.tostring+' where cdempresa='+empresa.cdempresa.tostring+' and cd'+tbl+'entrega='+codigo_origem.tostring+';');
    end;
    sql.Add('delete from '+tbl+' where cdempresa='+empresa.cdempresa.tostring+' and cd'+tbl+'='+codigo_origem.tostring+';');
    result := ExecutaScript(sql);
  finally
    FreeAndNil(sql);
  end;
end;

procedure TfrmManager.inserir_sub_nivel(codigopai, codigodestino:integer);
var
  s : TClasseQuery;
  codigo : integer;
begin
  s := TClasseQuery.Create('select '+tbl+'.nm'+tbl+',cd'+tbl+',nunivel from '+tbl+' where cdempresa='+empresa.cdempresa.tostring+' and cd'+tbl+'pai='+codigopai.tostring+' order by nunivel');
  try
    while not s.q.Eof do
    begin
      codigo := InserirRegistro(s.q.fieldbyname(_nm+tbl).AsString, codigodestino);
      inserir_sub_nivel(s.q.fieldbyname(_cd+tbl).AsInteger, codigo);
      transferir_registro(s.q.fieldbyname(_cd+tbl).AsInteger, codigo);
      s.q.Next;
    end;
  finally
    freeandnil(s);
  end;
end;

procedure TfrmManager.RecortarNivel(codigo_recortar, codigo_colar: integer);
var
  nome : string;
  codigo : integer;
begin
  // criar novo nivel
  // obter o número do proximo nivel do nivel existente selecionado
  // verificar se excede capacidade
  nome   := qregistro.NomedoCodigo(tbl, codigo_recortar);
  codigo := InserirRegistro(nome, codigo_colar);
  // criar sub niveis
  inserir_sub_nivel(codigo_recortar, codigo);
  transferir_registro(codigo_recortar, codigo);
  Atualizar;
  // mover cada nivel para novo nivel
  // excluir sub niveis em ordem descrecente
  // excluir nivel
end;

end.
