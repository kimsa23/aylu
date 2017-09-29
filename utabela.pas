unit utabela;

interface

uses
  System.Actions, System.UITypes,FireDAC.Comp.Client,
  forms, StdCtrls, SysUtils, Menus, Classes, ActnList, Controls, ExtCtrls,
  SqlExpr,
  uDtmMain, rotina.interbase, dialogo.ExportarExcel, uConstantes,
  classe.ColumnField, classe.registro, rotina.retornasql, classe.registrainformacao,
  classe.gerar, orm.empresa, classe.Aplicacao, classe.query, orm.tabela,
  cxCheckBox, cxPC, cxDBLookupComboBox,
  cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, dxBar,
  cxClasses, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxButtonEdit, Dialogs,
  cxTextEdit, cxNavigator, cxDBNavigator, dxBarExtItems, DB,
  cxColorComboBox, cxContainer, cxMaskEdit, cxDropDownEdit,
  cxDBColorComboBox;

type
  TfrmTabela1 = class(TForm)
    pnl: TPanel;
    act: TActionList;
    actfechar: TAction;
    bmg1: TdxBarManager;
    dxbrManager1Bar: TdxBar;
    dxbrlrgbtnfechar: TdxBarLargeButton;
    tbv: TcxGridDBTableView;
    grdLevel1: TcxGridLevel;
    grd: TcxGrid;
    dts: TDataSource;
    bmg1Bar1: TdxBar;
    dxBarDockControl1: TdxBarDockControl;
    actexportarexcel: TAction;
    dxBarButton1: TdxBarButton;
    actfiltrar: TAction;
    btnfiltro: TdxBarButton;
    btnagrupar: TdxBarButton;
    actagrupar: TAction;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    ColorDialog1: TColorDialog;
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure actfecharExecute(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure tbvKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actexportarexcelExecute(Sender: TObject);
    procedure actfiltrarExecute(Sender: TObject);
    procedure actagruparExecute(Sender: TObject);
    procedure grdDBTableView1Column1PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure qryBeforeDelete(DataSet: TDataSet);
    procedure tbvEditDblClick(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit);
    procedure FormCreate(Sender: TObject);
    procedure actExecute(Action: TBasicAction; var Handled: Boolean);
  private
    qry : TFDQuery;
    registro : TRegistro;
    tabela : ttabela;
    function  existe_campo(nmfield:string):Boolean;
    procedure set_dados(nmtabela:string);
    procedure set_readonly;
    procedure ConfigurarButtonEdit;
    procedure CDDIGITADOPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure cdPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
  public    { Public declarations }
  end;

var
  frmTabela1 : TfrmTabela1;

procedure AbrirTabela(pnlprincipal: TPanel; tbl:string);

implementation

uses uMain, rotina.Registro;

{$R *.DFM}

procedure AbrirTabela(pnlprincipal: TPanel; tbl:string);
begin
  frmTabela1             := TfrmTabela1.Create(application);
  frmTabela1.Parent      := pnlprincipal;
  frmTabela1.BorderStyle := bsnone;
  frmTabela1.Align       := alclient;
  frmTabela1.bringtofront;
  frmTabela1.Visible     := true;
  frmTabela1.set_dados(tbl);
  frmTabela1.ConfigurarButtonEdit;
end;

procedure TfrmTabela1.set_dados(nmtabela: string);
begin
  tabela.Select(_nmtabela+'='+UpperCase(nmtabela.QuotedString));
  registro     := TRegistro.create(Self, nmtabela, tabela.nmexibe, _o, qry, dts, nil);
  pnl.Caption  := tabela.nmexibe;
  if tabela.dssql = '' then
  begin
    qry.SQL.Text := QRetornaSQL.get_select_from(nmtabela);
  end
  else
  begin
    qry.SQL.Text := tabela.dssql;
  end;
  if ExisteCampoNaTabela(nmtabela, _cdempresa) then
  begin
    qry.SQL.Text := qry.SQL.Text + ' where '+tabela.nmtabela+'.cdempresa='+empresa.cdempresa.tostring+' ';
  end;
  qry.Open;
  set_colunas(registro, tabela.nmtabela, qry, tbv);
  set_readonly;
  grd.SetFocus;
end;

procedure TfrmTabela1.qryAfterScroll(DataSet: TDataSet);
begin
  pnl.Caption := tabela.nmexibe;
  if existe_campo(_cd+tabela.nmtabela) then
  begin
    pnl.Caption := pnl.Caption + ' '  +qry.fieldbyname(_cd+tabela.nmtabela).AsString;
  end;
  if existe_campo(_nm+tabela.nmtabela) then
  begin
    pnl.Caption := pnl.Caption + ' - '+qry.fieldbyname(_nm+tabela.nmtabela).AsString;
  end;
end;

procedure TfrmTabela1.actfecharExecute(Sender: TObject);
begin
  close;
  frmmain.main.DestruirBotaoFormAtual(tabela.nmtabela, frmmain.tlbnew);
end;

function TfrmTabela1.existe_campo(nmfield: string): Boolean;
var
  i : integer;
begin
  result := False;
  for i := 0 to qry.FieldCount - 1 do
  begin
    if qry.Fields[i].FieldName = UpperCase(nmfield) then
    begin
      result := True;
      Break;
    end;
  end;
end;

procedure TfrmTabela1.qryBeforePost(DataSet: TDataSet);
begin
  if lowercase(tabela.nmtabela) = _serie then
  begin
    if (dataset.FieldByName(_boservico).AsString = 'S') and (DataSet.FieldByName(_nudocfiscalicms).AsString <> '01') then
    begin
      MessageDlg('Documento Fiscal ICMS '+DataSet.FieldByName(_nudocfiscalicms).AsString+' não pode ser serviço.'#13'Favor desmarcar o campo Serviço para continuar.', mtInformation, [mbOK], 0);
      dataset.FieldByName(_boservico).FocusControl;
      Abort;
    end;
  end;
  if lowercase(tabela.nmtabela) = _movimentacao then
  begin
    if dataset.fieldbyname(_cdplconta).isnull then
    begin
      dataset.fieldbyname(_nuplconta).clear;
    end
    else
    begin
      dataset.fieldbyname(_nuplconta).asstring := qregistro.stringdocodigo(_plconta, dataset.fieldbyname(_cdplconta).asinteger, _nunivel);
    end;
    if dataset.fieldbyname(_cdcntcusto).isnull then
    begin
      dataset.fieldbyname(_nucntcusto).clear;
    end
    else
    begin
      dataset.fieldbyname(_nucntcusto).asstring := qregistro.stringdocodigo(_cntcusto, dataset.fieldbyname(_cdcntcusto).asinteger, _nunivel);
    end;
  end;
  if existe_campo(_cd+tabela.nmtabela) and DataSet.FieldByName(_cd+tabela.nmtabela).IsNull then
  begin
    DataSet.FieldByName(_cd+tabela.nmtabela).AsInteger := qgerar.GerarCodigo(tabela.nmtabela);
  end;
  if existe_campo(_cdempresa) then
  begin
    RegistraInformacao_(dataset);
  end;
end;

procedure TfrmTabela1.set_readonly;
var
  boativar: boolean;
begin
  boativar                  := existe_campo(_cdempresa);
  tbv.OptionsData.Editing   := boativar;
  tbv.OptionsData.Appending := boativar;
  tbv.OptionsData.Deleting  := boativar;
  tbv.OptionsData.Inserting := boativar;
  if tabela.nmtabela = _sticms then
  begin
    tbv.OptionsData.Editing := true;
  end;
end;

procedure TfrmTabela1.tbvKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  ExportarExcel(Key, sender);
  registro.ExibirInformacaoRegistro(qry, key);
end;

procedure TfrmTabela1.actExecute(Action: TBasicAction; var Handled: Boolean);
begin
  dtmmain.LogSiteAction(self.Name, action.Name);
end;

procedure TfrmTabela1.actexportarexcelExecute(Sender: TObject);
begin
  exportarexcel(grd);
end;

procedure TfrmTabela1.actfiltrarExecute(Sender: TObject);
begin
  tbv.FilterRow.Visible := btnfiltro.down;
end;

procedure TfrmTabela1.actagruparExecute(Sender: TObject);
begin
  tbv.OptionsView.GroupByBox := btnagrupar.down;
end;

procedure TfrmTabela1.grdDBTableView1Column1PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  colordialog : TColorDialog;
begin
  colordialog := TColorDialog.Create(nil);
  try
    if colordialog.Execute then
    begin
      TcxButtonEdit(Sender).EditingText := IntToStr(colordialog.Color);
    end;
  finally
    colordialog.Free;
  end;
end;

procedure TfrmTabela1.FormCreate(Sender: TObject);
begin
  tabela           := TTabela.Create;
  qry              := TFDQuery.create(nil);
  qry.Connection   := aplicacao.confire;
  dts.dataset      := qry;
  qry.BeforePost   := qryBeforePost;
  qry.AfterScroll  := qryAfterScroll;
  qry.BeforeDelete := qryBeforeDelete;
end;

procedure TfrmTabela1.FormDestroy(Sender: TObject);
begin
  freeandnil(qry);
  freeandnil(tabela);
  freeandnil(registro);
end;

procedure TfrmTabela1.qryBeforeDelete(DataSet: TDataSet);
begin
  if (LowerCase(tabela.nmtabela) = _storcamento) and (qry.FieldByName(_cdstorcamento).AsInteger in [1, 2, 3, 4]) then
  begin
    MessageDlg('Este status não pode ser excluído.'#13'Faz parte da configuração do sistema.', mtInformation, [mbOK], 0);
    abort;
  end;
end;

procedure TfrmTabela1.tbvEditDblClick(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit);
begin
  if (LowerCase(TcxGridDBColumn(AItem).DataBinding.FieldName) = _nucor) and ColorDialog1.Execute then
  begin
    if (qry.State <> dsEdit) or (qry.State <> dsinsert) then
    begin
      qry.Edit;
    end;
    TcxGridDBColumn(AItem).DataBinding.Field.AsInteger := ColorDialog1.Color;
  end;
end;

procedure TfrmTabela1.ConfigurarButtonEdit;
var
  i : integer;
begin
  for i := 0 to tbv.ColumnCount - 1 do
  begin
    if tbv.Columns[i].PropertiesClassName <> 'TcxButtonEditProperties' then
    begin
      Continue;
    end;
    if LowerCase(tbv.Columns[i].DataBinding.FieldName) = _cddigitado then
    begin
      TcxButtonEditProperties(tbv.Columns[i].Properties).OnButtonClick := CDDIGITADOPropertiesButtonClick;
    end
    else
    begin
      tbv.Columns[i].Tag := QRegistro.CodigodoNomeInteiro(_campo, tbv.Columns[i].DataBinding.FieldName);
      TcxButtonEditProperties(tbv.Columns[i].Properties).OnButtonClick := cdPropertiesButtonClick;
    end;
  end;
end;

procedure TfrmTabela1.CDDIGITADOPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  registro.ButtonEditProduto(tabela.nmtabela, qry, false);
end;

procedure TfrmTabela1.cdPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  I: Integer;
  tblbutton, tblorigem : string;
begin
  for I := 0 to tbv.ColumnCount - 1 do
  begin
    if tbv.Columns[i].Focused then
    begin
      tblorigem := Copy(tbv.Columns[i].DataBinding.FieldName, 3, Length(tbv.Columns[i].DataBinding.FieldName)-2);
      tblbutton := tblorigem;
      if (LowerCase(tblbutton) = _remetente) or (LowerCase(tblbutton) = _destinatario) then
      begin
        tblbutton := _cliente;
      end;
      if registro.ButtonEdit(qry, tblbutton, tbv.Columns[i].DataBinding.FieldName) then
      begin
        if qry.FieldByName(_nm+tblorigem).ReadOnly then
        begin
          qry.FieldByName(_nm+tblorigem).ReadOnly := False;
        end;
        tbv.GetColumnByFieldName(_nm+tblorigem).DataBinding.Field.AsString := qregistro.NomedoCodigo(_cliente, tbv.Columns[i].DataBinding.Field.AsLargeInt);
      end;
    end;
  end;
end;

end.
