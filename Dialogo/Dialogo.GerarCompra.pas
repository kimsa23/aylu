unit Dialogo.GerarCompra;

interface

uses
  System.Actions, System.UITypes, data.db,
  forms, Variants, Buttons, StdCtrls, ComCtrls, Controls, Mask, Classes, ExtCtrls,
  Menus, dialogs, sysutils, Windows,
  sqlexpr,
  rotina.registro, ulocalizar, uconstantes,
  orm.empresa, classe.form, orm.ordcompra, orm.entrada,
  cxLookAndFeelPainters, cxTextEdit, cxControls, cxContainer, cxEdit, cxMaskEdit,
  cxButtonEdit, cxButtons, cxGraphics, cxLookAndFeels, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxCheckListBox, cxLabel, cxCalendar, dxCore,
  cxDateUtils;

type
  TfrmgerarCompra = class(TForm)
    lblCliente: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    btnok: TcxButton;
    btncancelar: TcxButton;
    edtnuentrada: TcxTextEdit;
    cbxcdtpentrada: TcxLookupComboBox;
    cbxcdcfop: TcxLookupComboBox;
    lblproduto: TcxLabel;
    clb: TcxCheckListBox;
    edtdtemissao: TcxDateEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    cbxnudocfiscalicms: TcxLookupComboBox;
    lbl3: TLabel;
    edtnuchave: TcxTextEdit;
    lbl4: TLabel;
    edtnuserie: TcxTextEdit;
    procedure btnOkClick(Sender: TObject);
    procedure grdDblClick(Sender: TObject);
    procedure edtnuentradaKeyPress(Sender: TObject; var Key: Char);
    procedure colorenter(Sender: TObject);
    procedure colorexit(Sender: TObject);
    procedure nextcontrol(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure cbxcdtpentradaEnter(Sender: TObject);
    procedure cbxcdcfopExit(Sender: TObject);
    procedure cbxcdtpentradaExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private   { Private declarations }
    ordcompra : TOrdCompra;
    entrada : TEntrada;
    procedure CarregarProduto;
    //procedure ExcluirItemNaoSelecionado;
    procedure AtribuirParametro;
    procedure VerificarCentroCustoPlanoContas;
  public    { Public declarations }
  end;

var
  frmgerarCompra: TfrmgerarCompra;

function GerarCompra(value : tordcompra):boolean;

implementation

uses uMain, rotina.strings, uDtmMain;

{$R *.DFM}

function GerarCompra(value : tordcompra):boolean;
begin
  result         := false;
  frmGerarCompra := TfrmGerarCompra.Create(application);
  try
    frmGerarCompra.ordcompra := value;
    frmGerarCompra.ordcompra.fornecedor := value.fornecedor;
    frmGerarCompra.CarregarProduto;
    frmGerarCompra.showmodal;
    if frmGerarCompra.ModalResult <> mrok then
    begin
      exit;
    end;
    frmmain.NovaCompra(frmGerarCompra.ordcompra, frmGerarCompra.entrada);
    result := true;
  finally
    freeandnil(frmGerarCompra);
  end;
end;

procedure TfrmgerarCompra.AtribuirParametro;
begin
  entrada.nuentrada       := StrToInt(edtnuentrada.Text);
  entrada.nudocfiscalicms := cbxnudocfiscalicms.EditValue;
  entrada.cdtpentrada     := cbxcdtpentrada.EditValue;
  entrada.cdcfop          := cbxcdcfop.EditValue;
  entrada.nuchavenfe      := edtnuchave.Text;
  entrada.nuserie         := edtnuserie.Text;
  entrada.dtemissao       := edtdtemissao.Date;
end;

procedure TfrmgerarCompra.btnOkClick(Sender: TObject);
var
  nucnpj : string;
begin
  if varisnull(cbxcdtpentrada.EditValue) then
  begin
    messagedlg(Format(_msg_s_eh_um_campo_obrigatorio, [_Documento]), mtinformation, [mbok], 0);
    cbxcdtpentrada.SetFocus;
    abort;
  end;
  if varisnull(cbxcdcfop.EditValue) then
  begin
    messagedlg(Format(_msg_s_eh_um_campo_obrigatorio, [_CFOP]), mtinformation, [mbok], 0);
    cbxcdcfop.SetFocus;
    abort;
  end;
  if edtnuentrada.Text='' then
  begin
    messagedlg(Format(_msg_s_eh_um_campo_obrigatorio, [_Nota_Fiscal]), mtinformation, [mbok], 0);
    edtnuentrada.SetFocus;
    abort;
  end;
  if edtnuserie.Text='' then
  begin
    messagedlg(Format(_msg_s_eh_um_campo_obrigatorio, [__Numero+' '+__Serie]), mtinformation, [mbok], 0);
    edtnuserie.SetFocus;
    abort;
  end;
  if edtdtemissao.Text = '' then
  begin
    messagedlg(Format(_msg_s_eh_um_campo_obrigatorio, [_Data+' '+_de+' '+__Emissao]), mtinformation, [mbok], 0);
    edtdtemissao.SetFocus;
    abort;
  end;
  if varisnull(cbxnudocfiscalicms.EditValue) then
  begin
    messagedlg(Format(_msg_s_eh_um_campo_obrigatorio, [_Documento+' '+_Fiscal]), mtinformation, [mbok], 0);
    cbxnudocfiscalicms.SetFocus;
    abort;
  end;
  if ((cbxnudocfiscalicms.EditValue = _55) or (cbxnudocfiscalicms.EditValue = _57)) and (edtnuchave.Text = '') then
  begin
    messagedlg(Format(_msg_s_eh_um_campo_obrigatorio, [_Chave]), mtinformation, [mbok], 0);
    edtnuchave.SetFocus;
    abort;
  end;
  if edtnuchave.Text <> '' then
  begin
    nucnpj       := qregistro.stringdocodigo(_fornecedor, ordcompra.cdfornecedor, _nucnpj);
    if inttostr(ordcompra.fornecedor.cduf) <> copy(edtnuchave.Text, 1, 2) then
    begin
      messagedlg('Número da Chave Eletrônica inválido.'#13+
                 'O código da unidade federativa do emitente ('+ordcompra.fornecedor.cduf.tostring+') não confere com a posição 1 e 2 ('+Copy(edtnuchave.Text, 1, 2)+').', mtinformation, [mbok], 0);
      edtnuchave.SetFocus;
      abort;
    end;
    if formatdatetime(_yymm, edtdtemissao.Date) <> copy(edtnuchave.Text, 3, 4) then
    begin
      messagedlg('Número da Chave Eletrônica inválido.'#13'O ano e mês da data de emissão ('+formatdatetime(_yymm, edtdtemissao.Date)+') da nota não confere com a posição 3 até a 6 ('+copy(edtnuchave.Text, 3, 4)+').', mtinformation, [mbok], 0);
      edtnuchave.SetFocus;
      abort;
    end;
    if removercaracteres(nucnpj) <> copy(edtnuchave.Text, 7, 14) then
    begin
      messagedlg('Número da Chave Eletrônica inválido.'#13'O CNPJ ('+removercaracteres(nucnpj)+') do emitente da nota não confere com a posição 7 até a 20 ('+copy(edtnuchave.Text, 7, 14)+').', mtinformation, [mbok], 0);
      edtnuchave.SetFocus;
      abort;
    end;
    if cbxnudocfiscalicms.EditValue <> copy(edtnuchave.Text, 21, 2) then
    begin
      messagedlg('Número da Chave Eletrônica inválido.'#13'O modelo ('+cbxnudocfiscalicms.EditValue+') da nota não confere com a posição 21 e 22 ('+copy(edtnuchave.Text, 21, 2)+').', mtinformation, [mbok], 0);
      edtnuchave.SetFocus;
      abort;
    end;
    if FormatarTextoEsquerda(edtnuserie.Text, 3, _0) <> copy(edtnuchave.Text, 23, 3) then
    begin
      messagedlg('Número da Chave Eletrônica inválido.'#13'A série ('+FormatarTextoEsquerda(edtnuserie.Text, 3, _0)+') da nota não confere com a posição 23 até a 25 ('+copy(edtnuchave.Text, 23, 3)+').', mtinformation, [mbok], 0);
      edtnuchave.SetFocus;
      abort;
    end;
    if FormatarTextoEsquerda(edtnuentrada.Text, 9,_0) <> copy(edtnuchave.Text, 26, 9) then
    begin
      messagedlg('Número da Chave Eletrônica inválido.'#13'O número ('+FormatarTextoEsquerda(edtnuentrada.Text, 9,_0)+') da nota não confere com a posição 26 até a 34 ('+copy(edtnuchave.Text, 26, 9)+').', mtinformation, [mbok], 0);
      edtnuchave.SetFocus;
      abort;
    end;
  end;
  AtribuirParametro;
  VerificarCentroCustoPlanoContas;
  modalresult := mrok;
end;

procedure TfrmgerarCompra.grdDblClick(Sender: TObject);
begin
  if btnok.enabled then
  begin
    btnOkClick(sender);
  end;
end;

procedure TfrmgerarCompra.CarregarProduto;
var
  x : Integer;
begin
  clb.Clear;
  for x := 0 to ordcompra.ItOrdCompra.Count - 1 do
  begin
    if ordcompra.ItOrdCompra.Items[x].qtitem <= ordcompra.ItOrdCompra.Items[x].qtatendida then
    begin
      Continue;
    end;
    if ordcompra.ItOrdCompra.Items[x].produto.cdproduto = 0 then
    begin
      ordcompra.ItOrdCompra.Items[x].produto.Select(ordcompra.ItOrdCompra.Items[x].cdproduto);
    end;
    clb.Items.Add;
    clb.Items[clb.Count-1].Text    := FormatarTextoDireita(Copy(ordcompra.ItOrdCompra.Items[x].cddigitado, 1, 10), 10)+' - '+
                                      FormatarTextoDireita(copy(ordcompra.ItOrdCompra.Items[x].produto.nmproduto, 1, 30), 30)+' - '+
                                      floattostr(ordcompra.ItOrdCompra.Items[x].qtitem - ordcompra.ItOrdCompra.Items[x].qtatendida);
    clb.Items[clb.Count-1].Tag     := ordcompra.ItOrdCompra.Items[x].cditordcompra;
    clb.Items[clb.Count-1].Checked := True;
  end;
  ordcompra.ItOrdCompra.ExcluirItensJaAtendidos;
end;

{
procedure TfrmgerarCompra.ExcluirItemNaoSelecionado;
var
  i : Integer;
begin
  for i := 0 to clb.Items.Count - 1 do
  begin
    if not clb.Items[i].Checked then
    begin
      ordcompra.ItOrdCompra.ExcluirItem(clb.Items[i].Tag);
    end;
  end;
end;
}

procedure TfrmgerarCompra.edtnuentradaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as twincontrol, true, true);
  end;
  QForm.KeyPressControl(key);
end;

procedure TfrmgerarCompra.colorenter(Sender: TObject);
begin
  TcxCustomTextEdit(Sender).Style.Color := _color_enter;
end;

procedure TfrmgerarCompra.colorexit(Sender: TObject);
begin
  TcxCustomTextEdit(Sender).Style.Color := _color_exit;
end;

procedure TfrmgerarCompra.nextcontrol(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := VK_TAB;
  end;
end;

procedure TfrmgerarCompra.VerificarCentroCustoPlanoContas;
begin
  entrada.tpentrada.Select(entrada.cdtpentrada);
  if (entrada.tpentrada.bocntcusto = _S) and (not ordcompra.ItOrdCompra.CentroCustoPreenchido) then
  begin
    MessageDlg('Centro de custo não preenchido em algum item da ordem de compra.', mtInformation, [mbok], 0);
    abort;
  end;
  if (entrada.tpentrada.boplconta = _S) and (not ordcompra.ItOrdCompra.PlanoContasPreenchido) then
  begin
    MessageDlg('Plano de Contas não preenchido em algum item da ordem de compra.', mtInformation, [mbok], 0);
    abort;
  end;
end;

procedure TfrmgerarCompra.FormCreate(Sender: TObject);
begin
  cbxcdtpentrada.Properties.ListSource     := abrir_tabela(_tpentrada);
  cbxnudocfiscalicms.Properties.ListSource := abrir_tabela(_docfiscalicms);
  cbxcdcfop.Properties.ListSource          := abrir_tabela(_cfop);
  entrada := tentrada.create;
end;

procedure TfrmgerarCompra.FormDestroy(Sender: TObject);
begin
  FreeAndNil(entrada);
end;

procedure TfrmgerarCompra.cbxcdtpentradaEnter(Sender: TObject);
begin
  colorEnter(sender);
  abrir_tabela(_tpentrada);
end;

procedure TfrmgerarCompra.cbxcdcfopExit(Sender: TObject);
begin
  if varisnull(cbxcdcfop.EditValue) then
  begin
    colorexit(sender);
    Exit;
  end;
  if (ordcompra.fornecedor.cduf = empresa.endereco.cduf) and (Copy(cbxcdcfop.EditValue, 1, 1) <> _1) then
  begin
    messagedlg('Número de CFOP inválido!'#13'Fornecedor é da mesma unidade federativa da Empresa.'#13'Digite um número que comece com 1 ou 3 para continuar.', mtinformation, [mbok], 0);
    cbxcdcfop.SetFocus;
    Abort;
  end;
  if (ordcompra.fornecedor.cduf <> empresa.endereco.cduf) and (Copy(cbxcdcfop.EditValue, 1, 1) = _1) then
  begin
    messagedlg('Número de CFOP inválido!'#13'Fornecedor é de uma unidade federativa diferente da Empresa.'#13'Digite um número que comece com 2 ou 3 para continuar.', mtinformation, [mbok], 0);
    cbxcdcfop.SetFocus;
    Abort;
  end;
  colorexit(sender);
end;

procedure TfrmgerarCompra.cbxcdtpentradaExit(Sender: TObject);
var
  cdcfop : string;
begin
  if (not varisnull(cbxcdcfop.EditValue)) or (VarIsNull(cbxcdtpentrada.EditValue)) then
  begin
    colorexit(sender);
    Exit;
  end;
  if ordcompra.fornecedor.cduf <> empresa.endereco.cduf then
  begin
    cdcfop := NomedoCodigo(_tpentrada, cbxcdtpentrada.EditValue, _cdcfop+_f+_uf);
  end
  else
  begin
    cdcfop := NomedoCodigo(_tpentrada, cbxcdtpentrada.EditValue, _cdcfop+_d+_uf);
  end;
  if cdcfop <> '' then
  begin
    cbxcdcfop.EditValue := cdcfop;
  end;
  colorexit(sender);
end;

end.
