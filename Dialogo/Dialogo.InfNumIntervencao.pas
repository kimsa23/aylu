unit Dialogo.InfNumIntervencao;

interface

uses
  System.Actions, System.UITypes,
  forms, StdCtrls, Buttons, Controls, ExtCtrls, Classes, dialogs, Menus, sysutils,
  sqlexpr,
  uConstantes, rotina.strings, rotina.registro,
  classe.form, orm.produto,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxButtons, cxPC;

type
  TfrmdlginfNumIntervencao = class(TForm)
    lbl: TLabel;
    btncancelar: TcxButton;
    btnok: TcxButton;
    edtcdintervencao: TEdit;
    procedure btnokClick(Sender: TObject);
    procedure edtcdintervencaoKeyPress(Sender: TObject; var Key: Char);
  private    { Private declarations }
    tbl, exibe : string;
  public    { Public declarations }
  end;

Function  InformeNumeroNota            :string;
function  InformeNumeroDias            (nudias:integer=0):integer;
procedure Exibir_chave_nfe             (exibe, nusaida, chave:string);
function  InformeChaveNFE:string;
function  Leitura_Codigo_Bairra_produto:integer;

var
  frmdlginfNumIntervencao: TfrmdlginfNumIntervencao;

implementation

{$R *.dfm}

function Leitura_Codigo_Bairra_produto:integer;
var
  produto : TProduto;
begin
  result := 0;
  frmdlginfNumIntervencao := TfrmdlginfNumIntervencao.create(application);
  produto := tproduto.create;
  try
    frmdlginfnumIntervencao.Caption                   := 'Leitura C�digo Barras';
    frmdlginfnumIntervencao.lbl.Caption               := qstring.maiuscula(_Produto);
    frmdlginfnumIntervencao.edtcdintervencao.ReadOnly := false;
    frmdlginfnumIntervencao.btnok.Default             := True;
    frmdlginfnumIntervencao.ShowModal;
    if frmdlginfnumIntervencao.ModalResult = mrOk then
    begin
      result := produto.CodigoProdutoDigitado(frmdlginfnumIntervencao.edtcdintervencao.Text, '');
      if Result = 0 then
      begin
        MessageDlg(Format(_msg_codigo_inexistente_na_tabela, [frmdlginfnumIntervencao.edtcdintervencao.Text, qstring.maiuscula(_produto)]), mterror, [mbok], 0);
        Exit;
      end;
    end;
  finally
    produto.Destroy;
    freeandnil(frmdlginfnumIntervencao);
  end;
end;

procedure Exibir_chave_nfe(exibe, nusaida, chave:string);
begin
  frmdlginfNumIntervencao := TfrmdlginfNumIntervencao.create(application);
  try
    frmdlginfnumIntervencao.Caption                   := Exibe+' '+nusaida+' Validada';
    frmdlginfnumIntervencao.lbl.Caption               := 'Chave';
    frmdlginfnumIntervencao.btncancelar.Visible       := False;
    frmdlginfnumIntervencao.edtcdintervencao.ReadOnly := True;
    frmdlginfnumIntervencao.edtcdintervencao.Text     := removercaracteres(chave);
    frmdlginfnumIntervencao.ShowModal;
  finally
    freeandnil(frmdlginfnumIntervencao);
  end;
end;

function InformeChaveNFE:string;
begin
  frmdlginfNumIntervencao := TfrmdlginfNumIntervencao.create(application);
  try
    frmdlginfnumIntervencao.Caption                   := 'Download Chave NFE';
    frmdlginfnumIntervencao.lbl.Caption               := 'Chave';
    frmdlginfnumIntervencao.btncancelar.Visible       := true;
    frmdlginfnumIntervencao.edtcdintervencao.ReadOnly := false;
    result := '';
    if frmdlginfnumIntervencao.ShowModal = mrok then
    begin
      result := frmdlginfnumIntervencao.edtcdintervencao.Text;
    end;
  finally
    freeandnil(frmdlginfnumIntervencao);
  end;
end;

function InformeNumeroNota:string;
begin
  result := '';
  frmdlginfNumIntervencao := TfrmdlginfNumIntervencao.create(application);
  try
    frmdlginfnumIntervencao.exibe       := 'Nota Fiscal';
    frmdlginfnumIntervencao.tbl         := _saida;
    frmdlginfnumIntervencao.Caption     := 'Informe o n�mero da '+frmdlginfnumIntervencao.exibe;
    frmdlginfnumIntervencao.lbl.Caption := frmdlginfnumIntervencao.exibe;
    frmdlginfnumIntervencao.ShowModal;
    if frmdlginfNumIntervencao.ModalResult = mrCancel then
    begin
      exit;
    end;
    result := frmdlginfNumIntervencao.edtcdintervencao.Text;
  finally
    freeandnil(frmdlginfnumIntervencao);
  end;
end;

function InformeNumeroDias(nudias:integer=0):Integer;
begin
  result := 0;
  frmdlginfNumIntervencao := TfrmdlginfNumIntervencao.create(application);
  try
    frmdlginfnumIntervencao.exibe       := 'N�mero Dias';
    frmdlginfnumIntervencao.Caption     := 'Informe o n�mero de dias para renovar';
    frmdlginfnumIntervencao.lbl.Caption := frmdlginfnumIntervencao.exibe;
    frmdlginfnumIntervencao.ShowModal;
    if frmdlginfNumIntervencao.ModalResult = mrCancel then
    begin
      exit;
    end;
    result := strtoint(frmdlginfNumIntervencao.edtcdintervencao.Text);
  finally
    freeandnil(frmdlginfnumIntervencao);
  end;
end;

procedure TfrmdlginfNumIntervencao.btnokClick(Sender: TObject);
begin
  if tbl = '' then
  begin
    ModalResult := mrok;
    Exit;
  end;
  if edtcdintervencao.Text = '' then
  begin
    messagedlg(Format(_msg_s_eh_um_campo_obrigatorio, [__Numero+' '+_da+' '+exibe]), mtinformation, [mbok], 0);
    edtcdintervencao.setfocus;
    exit;
  end;
  if (lowercase(tbl) = _intervencao) and codigoexiste(tbl, _nu+tbl, _integer, edtcdintervencao.text) then
  begin
    messagedlg('N�mero da '+exibe+' j� existe no sistema.'#13'Digite outro n�mero para continuar.', mtinformation, [mbok], 0);
    edtcdintervencao.SetFocus;
    exit;
  end;
  if (lowercase(tbl) = _saida) and not codigoexiste(tbl, _nu+tbl, _integer, edtcdintervencao.text) then
  begin
    MessageDlg(Format(_msg_codigo_inexistente_na_tabela, [edtcdintervencao.text, qstring.maiuscula(exibe)]), mterror, [mbok], 0);
    edtcdintervencao.SetFocus;
    exit;
  end;
  ModalResult := mrok;
end;

procedure TfrmdlginfNumIntervencao.edtcdintervencaoKeyPress(Sender: TObject; var Key: Char);
begin
  QForm.KeyPressControl(key);
end;

end.
