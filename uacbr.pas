{$I ACBr.inc}

unit uAcbr;

interface

uses
  System.Actions, System.UITypes, System.TypInfo, Vcl.Samples.Spin,
  ActnList, Menus, DateUtils, IniFiles, ShellAPI,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  FileCtrl, Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, OleCtrls, SHDocVw,
  ACBR.ACBR, orm.empresa,
  uDtmMain, dialogo.SelecionarCertificado, //ufrmStatus,
  uConstantes,
  ACBrNFe, pcnConversao, ACBrNFeDANFEClass, ACBrUtil, ACBrDFeSSL, pcnConversaoNFe, blcksock,
  pcnNFe, ACBrDFe, ACBrBase, ACBrNFeNotasFiscais,
  cxLookAndFeelPainters, cxButtons, cxContainer,
  cxEdit, cxTextEdit, cxPC, cxControls, cxCheckBox, cxGroupBox,
  cxRadioGroup, cxGraphics, cxMaskEdit, cxDropDownEdit, cxMemo,
  cxLookAndFeels, cxPCdxBarPopupMenu, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxLabel;

type
  Tfrmsetacbr = class(TForm)
    OpenDialog1: TOpenDialog;
    act: TActionList;
    actsalvar: TAction;
    ACBrNFe1: TACBrNFe;
    trv: TTreeView;
    ntb: TNotebook;
    lblcaminho: TLabel;
    Label2: TLabel;
    lblnumserie: TLabel;
    lSSLLib: TLabel;
    lCryptLib: TLabel;
    lHttpLib: TLabel;
    lXmlSign: TLabel;
    SpeedButton1: TSpeedButton;
    sbtnGetCert: TcxButton;
    sbtnCaminhoCert: TcxButton;
    edtNumSerie: TcxTextEdit;
    edtSenha: TcxTextEdit;
    edtCaminho: TcxTextEdit;
    cbSSLLib: TComboBox;
    cbCryptLib: TComboBox;
    cbHttpLib: TComboBox;
    cbXmlSignLib: TComboBox;
    Button1: TButton;
    Button3: TButton;
    Button4: TButton;
    Button10: TButton;
    Label29: TLabel;
    Label31: TLabel;
    Label1: TLabel;
    Label12: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    lbldscontingencia: TLabel;
    cbFormaEmissao: TComboBox;
    cbVersaoDF: TComboBox;
    cbModeloDF: TComboBox;
    cbxAtualizarXML: TCheckBox;
    cbxExibirErroSchema: TCheckBox;
    edtFormatoAlerta: TEdit;
    cbxRetirarAcentos: TCheckBox;
    edtIdToken: TEdit;
    edtToken: TEdit;
    memdscontingencia: TcxMemo;
    Label13: TLabel;
    lTimeOut: TLabel;
    Label14: TLabel;
    gbProxy: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    edtProxyHost: TEdit;
    edtProxyPorta: TEdit;
    edtProxyUser: TEdit;
    edtProxySenha: TEdit;
    gbxRetornoEnvio: TGroupBox;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    cbxAjustarAut: TCheckBox;
    edtTentativas: TEdit;
    edtIntervalo: TEdit;
    edtAguardar: TEdit;
    cbxVisualizar: TCheckBox;
    cbUF: TComboBox;
    rgTipoAmb: TRadioGroup;
    cbxSalvarSOAP: TCheckBox;
    seTimeOut: TSpinEdit;
    cbSSLType: TComboBox;
    Label3: TLabel;
    Label5: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    memEmailMsg: TcxMemo;
    ckbEmailSSL: TcxCheckBox;
    edtEmailAssunto: TcxTextEdit;
    edtSmtpPass: TcxTextEdit;
    edtSmtpUser: TcxTextEdit;
    edtSmtpHost: TcxTextEdit;
    edtSmtpPort: TcxTextEdit;
    ckbenviarpdf: TcxCheckBox;
    rdgtpenvio: TcxRadioGroup;
    Label7: TLabel;
    sbtnLogoMarca: TSpeedButton;
    edtLogoMarca: TEdit;
    Panel1: TPanel;
    btnSalvarConfig: TcxButton;
    btncancelar: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    GroupBox1: TGroupBox;
    cbxSalvarArqs: TCheckBox;
    cbxPastaMensal: TCheckBox;
    cbxAdicionaLiteral: TCheckBox;
    cbxEmissaoPathNFe: TCheckBox;
    cbxSalvaPathEvento: TCheckBox;
    cbxSepararPorCNPJ: TCheckBox;
    cbxSepararPorModelo: TCheckBox;
    cxLabel6: TcxLabel;
    rgFormaEmissaoMDFE: TRadioGroup;
    cxLabel8: TcxLabel;
    rgTipoDAMDFe: TRadioGroup;
    rgTipoDACTe: TRadioGroup;
    rgFormaEmissao: TRadioGroup;
    cxLabel9: TcxLabel;
    rgTipoDanfe: TRadioGroup;
    ckbbovtottribitem: TcxCheckBox;
    GroupBox5: TGroupBox;
    cbxSalvarArqsMDFE: TCheckBox;
    cbxPastaMensalMDFE: TCheckBox;
    cbxAdicionaLiteralMDFE: TCheckBox;
    cbxEmissaoPathMDFE: TCheckBox;
    cbxSepararPorCNPJMDFE: TCheckBox;
    GroupBox2: TGroupBox;
    Label19: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Label24: TLabel;
    SpeedButton4: TSpeedButton;
    Label20: TLabel;
    SpeedButton3: TSpeedButton;
    edtPathMDFE: TEdit;
    edtPathEventoMDFE: TEdit;
    ckSalvarMDFE: TCheckBox;
    edtPathLogsMDFE: TEdit;
    edtPathSchemasmdfe: TEdit;
    GroupBox3: TGroupBox;
    Label21: TLabel;
    SpeedButton5: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Label25: TLabel;
    SpeedButton11: TSpeedButton;
    Label30: TLabel;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    Label32: TLabel;
    edtPathCTE: TEdit;
    edtPathInuCTE: TEdit;
    edtPathEventoCTE: TEdit;
    CheckBox1: TCheckBox;
    edtPathLogsCTE: TEdit;
    edtPathSchemasCTE: TEdit;
    GroupBox4: TGroupBox;
    cbxSalvarArqsCTE: TCheckBox;
    cbxPastaMensalCTE: TCheckBox;
    cbxAdicionaLiteralCTE: TCheckBox;
    cbxEmissaoPathCTE: TCheckBox;
    cbxSepararPorCNPJCTE: TCheckBox;
    cbxSepararPorModeloCTE: TCheckBox;
    cxLabel10: TcxLabel;
    cxLabel7: TcxLabel;
    rdgversaodfcte: TRadioGroup;
    gbxnfearquivo: TGroupBox;
    Label35: TLabel;
    sbPathNFe: TSpeedButton;
    sbPathInu: TSpeedButton;
    Label40: TLabel;
    Label41: TLabel;
    sbPathDPEC: TSpeedButton;
    sbPathEvento: TSpeedButton;
    Label47: TLabel;
    edtPathNFe: TEdit;
    edtPathInu: TEdit;
    edtPathDPEC: TEdit;
    edtPathEvento: TEdit;
    Label42: TLabel;
    edtPathSchemas: TEdit;
    spPathSchemas: TSpeedButton;
    ckSalvar: TCheckBox;
    lblLOGS: TLabel;
    edtPathLogs: TEdit;
    sbtnPathSalvar: TSpeedButton;
    procedure sbtnGetCertClick(Sender: TObject);
    procedure actsalvarExecute(Sender: TObject);
    procedure cbxformaemissaoPropertiesChange(Sender: TObject);
    procedure rdgtpenvioPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure sbtnCaminhoCertClick(Sender: TObject);
    procedure cbSSLLibChange(Sender: TObject);
    procedure cbCryptLibChange(Sender: TObject);
    procedure cbHttpLibChange(Sender: TObject);
    procedure cbXmlSignLibChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure cbSSLTypeChange(Sender: TObject);
    procedure sbtnPathSalvarClick(Sender: TObject);
    procedure spPathSchemasClick(Sender: TObject);
    procedure sbtnLogoMarcaClick(Sender: TObject);
    procedure sbPathNFeClick(Sender: TObject);
    procedure sbPathInuClick(Sender: TObject);
    procedure sbPathDPECClick(Sender: TObject);
    procedure sbPathEventoClick(Sender: TObject);
    procedure trvChange(Sender: TObject; Node: TTreeNode);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure cbxSalvarArqsClick(Sender: TObject);
  private { Private declarations }
    acbr : TAcbr;
    procedure GravarConfiguracao ;
    procedure LerConfiguracao ;
    //function set_forma_emissao(nuforma: Integer): integer;
    procedure AtualizaSSLLibsCombo;
    procedure PathClick(Sender: TObject);
    procedure ConfigurarCertificado;
    procedure ConfigurarGeral;
    procedure ConfigurarWebService;
    procedure ConfigurarArquivo;
    procedure ConfigurarProxy;
    procedure ConfigurarEmail;
    procedure ConfigurarDanfe;
    procedure LimparPastaArquivos;
    procedure AtribuirPastaArquivo;
    procedure LimparTreeView;
    procedure ExcluirNoTreview(value: string);
    procedure ConfigurarEnabled(tag: Integer; value: Boolean);
  public { Public declarations }
  end;

function dlgsetNFEAcbr:Boolean;

implementation

const
  SELDIRHELP = 1000;

var
  frmsetacbr: Tfrmsetacbr;

{$R *.dfm}

function dlgsetNFEAcbr:Boolean;
begin
  result := False;
  frmsetacbr := tfrmsetacbr.create(nil);
  try
    if frmsetacbr.ShowModal = mrok then
    begin
      result := True;
    end;
  finally
    FreeAndNil(frmsetacbr);
  end;
end;

procedure Tfrmsetacbr.ConfigurarCertificado;
begin
  acbr.Certificado.Caminho    := edtCaminho.Text;
  acbr.Certificado.Senha      := edtSenha.Text;
  acbr.Certificado.NumSerie   := edtNumSerie.Text;
  acbr.Certificado.SSLLib     := cbSSLLib.ItemIndex;
  acbr.Certificado.CryptLib   := cbCryptLib.ItemIndex;
  acbr.Certificado.HttpLib    := cbHttpLib.ItemIndex;
  acbr.Certificado.XmlSignLib := cbXmlSignLib.ItemIndex;
end;

procedure Tfrmsetacbr.ConfigurarGeral;
begin
  acbr.geral.danfe              := rgTipoDanfe.ItemIndex;
  acbr.geral.dacte              := rgTipoDACTe.ItemIndex;
  acbr.Geral.dscontingencia     := memdscontingencia.Lines.Text;
  acbr.danfe.LogoMarca          := edtLogoMarca.Text;
  acbr.Geral.ExibirTotTribItem  := ckbbovtottribitem.Checked;
  acbr.Geral.AtualizarXML       := cbxAtualizarXML.Checked;
  acbr.Geral.ExibirErroSchema   := cbxExibirErroSchema.Checked;
  acbr.Geral.FormatoAlerta      := edtFormatoAlerta.Text;
  acbr.Geral.ModeloDF           := cbModeloDF.ItemIndex;
  acbr.Geral.VersaoDF           := cbVersaoDF.ItemIndex;
  acbr.geral.VersaoDFCTE        := rdgversaodfcte.ItemIndex;
  acbr.Geral.IdToken            := edtIdToken.Text;
  acbr.Geral.Token              := edtToken.Text;
  acbr.Geral.RetirarAcentos     := cbxRetirarAcentos.Checked;
  acbr.Geral.Salvar             := ckSalvar.Checked;
  acbr.Geral.SalvarMDFE         := ckSalvarMDFE.Checked;
  acbr.Geral.FormaEmissao       := cbformaemissao.ItemIndex;
  acbr.Geral.formaemissaoCTE    := rgFormaEmissao.ItemIndex;
  acbr.Geral.formaemissaoMDFE   := rgFormaEmissaoMDFE.ItemIndex;
end;

procedure Tfrmsetacbr.ConfigurarWebService;
begin
  acbr.WebService.UF         := cbUF.Text;
  acbr.WebService.Ambiente   := rgTipoAmb.ItemIndex;
  acbr.WebService.Visualizar := cbxVisualizar.Checked;
  acbr.WebService.SalvarSOAP := cbxSalvarSOAP.Checked;
  acbr.WebService.AjustarAut := cbxAjustarAut.Checked;
  acbr.WebService.Aguardar   := edtAguardar.Text;
  acbr.WebService.Tentativas := edtTentativas.Text;
  acbr.WebService.Intervalo  := edtIntervalo.Text;
  acbr.WebService.TimeOut    := seTimeOut.Value;
  acbr.WebService.SSLType    := cbSSLType.ItemIndex;
end;

procedure Tfrmsetacbr.ConfigurarEnabled(tag: Integer; value : Boolean);
var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
  begin
    if Components[i].Tag = tag then
    begin
      TControl(components[i]).Enabled := value;
    end;
  end;
end;

procedure Tfrmsetacbr.LimparPastaArquivos;
begin
  ConfigurarEnabled(1, cbxSalvarArqs.Checked);
  if cbxSalvarArqs.Checked then
  begin
    Exit;
  end;
  edtPathNFe.Text     := '';
  edtPathInu.Text     := '';
  edtPathDPEC.Text    := '';
  edtPathEvento.Text  := '';
end;

procedure Tfrmsetacbr.AtribuirPastaArquivo;
begin
  acbr.Arquivos.PathNFe     := edtPathNFe.Text;
  acbr.Arquivos.PathInu     := edtPathInu.Text;
  acbr.Arquivos.PathDPEC    := edtPathDPEC.Text;
  acbr.Arquivos.PathEvento  := edtPathEvento.Text;
end;

procedure Tfrmsetacbr.ConfigurarArquivo;
begin
  acbr.Arquivos.PastaMensal      := cbxPastaMensal.Checked;
  acbr.Arquivos.AddLiteral       := cbxAdicionaLiteral.Checked;
  acbr.Arquivos.EmissaoPathNFe   := cbxEmissaoPathNFe.Checked;
  acbr.Arquivos.SalvarPathEvento := cbxSalvaPathEvento.Checked;
  acbr.Arquivos.SepararPorCNPJ   := cbxSepararPorCNPJ.Checked;
  acbr.Arquivos.SepararPorModelo := cbxSepararPorModelo.Checked;
  acbr.Arquivos.Salvar           := cbxSalvarArqs.Checked;
  AtribuirPastaArquivo;
  acbr.arquivos.PathSchemas := edtPathSchemas.Text;
  acbr.arquivos.PathLogs    := edtPathLogs.Text;

  acbr.ArquivosCTE.Salvar           := cbxSalvarArqsCTE.Checked;
  acbr.ArquivosCTE.PastaMensal      := cbxPastaMensalCTE.Checked;
  acbr.ArquivosCTE.AddLiteral       := cbxAdicionaLiteralCTE.Checked;
  acbr.ArquivosCTE.EmissaoPathCTE   := cbxEmissaoPathCTE.Checked;
  acbr.ArquivosCTE.SepararPorCNPJ   := cbxSepararPorCNPJCTE.Checked;
  acbr.ArquivosCTE.SepararPorModelo := cbxSepararPorModeloCTE.Checked;
  acbr.ArquivosCTE.PathCTE          := edtPathCTE.Text;
  acbr.ArquivosCTE.PathInu          := edtPathInuCTE.Text;
  acbr.ArquivosCTE.PathEvento       := edtPathEventoCTE.Text;
  acbr.ArquivosCTE.PathSchemas      := edtPathSchemasCTE.Text;
  acbr.ArquivosCTE.PathLogs         := edtPathLogsCTE.Text;

  acbr.arquivosmdfe.Salvar          := cbxSalvarArqsMDFE.Checked;
  acbr.arquivosmdfe.PastaMensal     := cbxPastaMensalMDFE.Checked;
  acbr.arquivosmdfe.AddLiteral      := cbxAdicionaLiteralMDFE.Checked;
  acbr.arquivosmdfe.EmissaoPathMDFE := cbxEmissaoPathMDFE.Checked;
  acbr.arquivosmdfe.SepararPorCNPJ  := cbxSepararPorCNPJMDFE.Checked;
  acbr.arquivosmdfe.PathMDFE        := edtPathMDFE.Text;
  acbr.arquivosmdfe.PathEvento      := edtPathEventoMDFE.Text;
  acbr.arquivosmdfe.PathSchemas     := edtPathSchemasmdfe.Text;
  acbr.arquivosmdfe.PathLogs        := edtPathLogsmdfe.Text;
end;

procedure Tfrmsetacbr.ConfigurarProxy;
begin
  acbr.Proxy.Host  := edtProxyHost.Text;
  acbr.Proxy.Porta := edtProxyPorta.Text;
  acbr.Proxy.User  := edtProxyUser.Text;
  acbr.Proxy.Pass  := edtProxySenha.Text;
end;

procedure Tfrmsetacbr.ConfigurarEmail;
begin
  acbr.email.SmtpHost := edtSmtpHost.Text;
  acbr.email.SmtpPort := edtSmtpPort.Text;
  acbr.email.SmtpUser := edtSmtpUser.Text;
  acbr.email.SmtpPass := edtSmtpPass.Text;
  acbr.email.Assunto  := edtEmailAssunto.Text;
  acbr.email.boSSL    := ckbEmailSSL.Checked;
  acbr.email.boPDF    := ckbenviarpdf.Checked;
  acbr.email.TpEnvio  := rdgtpenvio.ItemIndex;
  acbr.email.msg      := memEmailMsg.Lines.text;
end;

procedure Tfrmsetacbr.ConfigurarDanfe;
begin
  acbr.DANFE.LogoMarca := edtLogoMarca.Text;
end;

procedure Tfrmsetacbr.GravarConfiguracao;
begin
  ConfigurarCertificado;
  ConfigurarGeral;
  ConfigurarWebService;
  ConfigurarArquivo;
  ConfigurarProxy;
  ConfigurarEmail;
  ConfigurarDanfe;
  acbr.GravarConfiguracao;
end;

procedure Tfrmsetacbr.SpeedButton11Click(Sender: TObject);
begin
  PathClick(edtPathEventoCTE);
end;

procedure Tfrmsetacbr.SpeedButton12Click(Sender: TObject);
begin
  PathClick(edtPathLogsCTE);
end;

procedure Tfrmsetacbr.SpeedButton13Click(Sender: TObject);
begin
  PathClick(edtPathSchemasCTE);
end;

procedure Tfrmsetacbr.SpeedButton1Click(Sender: TObject);
var
  I: Integer;
  ASerie: String;
  AddRow: Boolean;
begin
  frmSelecionarCertificado := TfrmSelecionarCertificado.Create(Self);
  try
    ACBrNFe1.SSL.LerCertificadosStore;
    AddRow := False;
    with frmSelecionarCertificado.StringGrid1 do
    begin
      ColWidths[0] := 220;
      ColWidths[1] := 250;
      ColWidths[2] := 120;
      ColWidths[3] := 80;
      ColWidths[4] := 150;
      Cells[ 0, 0 ] := 'Num.Série';
      Cells[ 1, 0 ] := 'Razão Social';
      Cells[ 2, 0 ] := 'CNPJ';
      Cells[ 3, 0 ] := 'Validade';
      Cells[ 4, 0 ] := 'Certificadora';
    end;
    For I := 0 to ACBrNFe1.SSL.ListaCertificados.Count-1 do
    begin
      with ACBrNFe1.SSL.ListaCertificados[I] do
      begin
        ASerie := NumeroSerie;
        if (CNPJ <> '') then
        begin
          with frmSelecionarCertificado.StringGrid1 do
          begin
            if Addrow then
            begin
              RowCount := RowCount + 1;
            end;
            Cells[ 0, RowCount-1] := NumeroSerie;
            Cells[ 1, RowCount-1] := RazaoSocial;
            Cells[ 2, RowCount-1] := CNPJ;
            Cells[ 3, RowCount-1] := FormatDateBr(DataVenc);
            Cells[ 4, RowCount-1] := Certificadora;
            AddRow := True;
          end;
        end;
      end;
    end;
    frmSelecionarCertificado.ShowModal;
    if frmSelecionarCertificado.ModalResult = mrOK then
    begin
      edtNumSerie.Text := frmSelecionarCertificado.StringGrid1.Cells[ 0, frmSelecionarCertificado.StringGrid1.Row];
    end;
  finally
     frmSelecionarCertificado.Free;
  end;
end;

procedure Tfrmsetacbr.SpeedButton2Click(Sender: TObject);
begin
  PathClick(edtPathMDFE);
end;

procedure Tfrmsetacbr.SpeedButton3Click(Sender: TObject);
begin
  PathClick(edtPathSchemasmdfe);
end;

procedure Tfrmsetacbr.SpeedButton4Click(Sender: TObject);
begin
  PathClick(edtPathLogsMDFE);
end;

procedure Tfrmsetacbr.SpeedButton5Click(Sender: TObject);
begin
  PathClick(edtPathCTE);
end;

procedure Tfrmsetacbr.SpeedButton7Click(Sender: TObject);
begin
  PathClick(edtPathEventoMDFE);
end;

procedure Tfrmsetacbr.SpeedButton9Click(Sender: TObject);
begin
  PathClick(edtPathInuCTE);
end;

procedure Tfrmsetacbr.spPathSchemasClick(Sender: TObject);
begin
  PathClick(edtPathSchemas);
end;

procedure Tfrmsetacbr.trvChange(Sender: TObject; Node: TTreeNode);
begin
  ntb.ActivePage := node.Text;
end;

procedure Tfrmsetacbr.LerConfiguracao;
begin
  acbr.LerConfiguracao;
  cbSSLLib.ItemIndex     := acbr.Certificado.SSLLib;
  cbCryptLib.ItemIndex   := acbr.Certificado.CryptLib;
  cbHttpLib.ItemIndex    := acbr.Certificado.HttpLib;
  cbXmlSignLib.ItemIndex := acbr.Certificado.XmlSignLib;
  edtSenha.Text          := acbr.Certificado.Senha;
  edtNumSerie.Text       := acbr.Certificado.NumSerie;
  edtCaminho.Text        := acbr.Certificado.Caminho;

  cbformaemissao.ItemIndex     := acbr.Geral.FormaEmissao;
  rgformaemissao.ItemIndex     := acbr.Geral.formaemissaoCTE;
  rgFormaEmissaoMDFE.ItemIndex := acbr.Geral.formaemissaoMDFE;
  memdscontingencia.Lines.Text := acbr.Geral.dscontingencia;
  ckbbovtottribitem.Checked    := acbr.Geral.ExibirTotTribItem;
  cbxAtualizarXML.Checked      := acbr.Geral.AtualizarXML;
  cbxExibirErroSchema.Checked  := acbr.Geral.ExibirErroSchema;
  edtFormatoAlerta.Text        := acbr.Geral.FormatoAlerta;
  cbModeloDF.ItemIndex         := acbr.Geral.ModeloDF;
  cbVersaoDF.ItemIndex         := acbr.Geral.VersaoDF;
  rdgversaodfcte.ItemIndex     := acbr.Geral.VersaoDFCTE;
  edtIdToken.Text              := acbr.Geral.IdToken;
  edtToken.Text                := acbr.Geral.Token;
  ckSalvar.Checked             := acbr.Geral.Salvar;
  ckSalvarMDFE.Checked         := acbr.Geral.SalvarMDFE;
  cbxRetirarAcentos.Checked    := acbr.Geral.RetirarAcentos;

  cbUF.ItemIndex        := cbUF.Items.IndexOf(acbr.WebService.UF);
  rgTipoAmb.ItemIndex   := acbr.WebService.Ambiente;
  cbxVisualizar.Checked := acbr.WebService.Visualizar;
  cbxSalvarSOAP.Checked := acbr.WebService.SalvarSOAP;
  cbxAjustarAut.Checked := acbr.WebService.AjustarAut;
  edtAguardar.Text      := acbr.WebService.Aguardar;
  edtTentativas.Text    := acbr.WebService.Tentativas;
  edtIntervalo.Text     := acbr.WebService.Intervalo;
  seTimeOut.Value       := acbr.WebService.TimeOut;
  cbSSLType.ItemIndex   := acbr.WebService.SSLType;

  cbxSalvarArqs.Checked       := acbr.Arquivos.Salvar;
  cbxPastaMensal.Checked      := acbr.Arquivos.PastaMensal;
  cbxAdicionaLiteral.Checked  := acbr.Arquivos.AddLiteral;
  cbxEmissaoPathNFe.Checked   := acbr.Arquivos.EmissaoPathNFe;
  cbxSalvaPathEvento.Checked  := acbr.Arquivos.SalvarPathEvento;
  cbxSepararPorCNPJ.Checked   := acbr.Arquivos.SepararPorCNPJ;
  cbxSepararPorModelo.Checked := acbr.Arquivos.SepararPorModelo;
  edtPathNFe.Text             := acbr.Arquivos.PathNFe;
  edtPathInu.Text             := acbr.Arquivos.PathInu;
  edtPathDPEC.Text            := acbr.Arquivos.PathDPEC;
  edtPathEvento.Text          := acbr.Arquivos.PathEvento;
  edtPathLogs.Text            := acbr.Arquivos.PathLogs;
  edtPathSchemas.Text         := acbr.arquivos.PathSchemas;

  cbxSalvarArqsCTE.Checked       := acbr.ArquivosCTE.Salvar;
  cbxPastaMensalCTE.Checked      := acbr.ArquivosCTE.PastaMensal;
  cbxAdicionaLiteralCTE.Checked  := acbr.ArquivosCTE.AddLiteral;
  cbxEmissaoPathCTE.Checked      := acbr.ArquivosCTE.EmissaoPathCTE;
  cbxSepararPorCNPJCTE.Checked   := acbr.ArquivosCTE.SepararPorCNPJ;
  cbxSepararPorModeloCTE.Checked := acbr.ArquivosCTE.SepararPorModelo;
  edtPathCTE.Text                := acbr.ArquivosCTE.PathCTE;
  edtPathInuCTE.Text             := acbr.ArquivosCTE.PathInu;
  edtPathEventoCTE.Text          := acbr.ArquivosCTE.PathEvento;
  edtPathLogsCTE.Text            := acbr.ArquivosCTE.PathLogs;
  edtPathSchemasCTE.Text         := acbr.ArquivosCTE.PathSchemas;

  cbxSalvarArqsMDFE.Checked      := acbr.arquivosmdfe.Salvar;
  cbxPastaMensalMDFE.Checked     := acbr.arquivosmdfe.PastaMensal;
  cbxAdicionaLiteralMDFE.Checked := acbr.arquivosmdfe.AddLiteral;
  cbxEmissaoPathMDFE.Checked     := acbr.arquivosmdfe.EmissaoPathMDFE;
  cbxSepararPorCNPJMDFE.Checked  := acbr.arquivosmdfe.SepararPorCNPJ;
  edtPathMDFE.Text               := acbr.arquivosmdfe.PathMDFE;
  edtPathEventoMDFE.Text         := acbr.arquivosmdfe.PathEvento;
  edtPathSchemasmdfe.Text        := acbr.arquivosmdfe.PathSchemas;

  edtProxyHost.Text  := acbr.Proxy.Host;
  edtProxyPorta.Text := acbr.Proxy.Porta;
  edtProxyUser.Text  := acbr.Proxy.User;
  edtProxySenha.Text := acbr.Proxy.Pass;

  edtSmtpHost.Text       := acbr.Email.smtpHost;
  edtSmtpPort.Text       := acbr.Email.smtpPort;
  edtSmtpUser.Text       := acbr.Email.smtpUser;
  edtSmtpPass.Text       := acbr.Email.smtpPass;
  edtEmailAssunto.Text   := acbr.Email.Assunto;
  ckbEmailSSL.Checked    := acbr.Email.boSSL;
  ckbenviarpdf.Checked   := acbr.Email.boPDF;
  rdgtpenvio.ItemIndex   := acbr.Email.TpEnvio;
  memEmailMsg.Lines.text := acbr.Email.msg;

  rgTipoDanfe.ItemIndex := acbr.DANFE.Tipo;
  edtLogoMarca.Text     := acbr.danfe.LogoMarca;
  acbr.AplicarConfiguracao(ACBrNFe1);
  LimparPastaArquivos;
end;

procedure Tfrmsetacbr.PathClick(Sender: TObject);
var
  Dir: string;
begin
  if Length(TEdit(Sender).Text) <= 0 then
  begin
    Dir := ExtractFileDir(application.ExeName);
  end
  else
  begin
    Dir := TEdit(Sender).Text;
  end;
  if SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt],SELDIRHELP) then
  begin
    TEdit(Sender).Text := Dir;
  end;
end;

procedure Tfrmsetacbr.sbPathDPECClick(Sender: TObject);
begin
  PathClick(edtPathDPEC);
end;

procedure Tfrmsetacbr.sbPathEventoClick(Sender: TObject);
begin
  PathClick(edtPathEvento);
end;

procedure Tfrmsetacbr.sbPathInuClick(Sender: TObject);
begin
  PathClick(edtPathInu);
end;

procedure Tfrmsetacbr.sbPathNFeClick(Sender: TObject);
begin
  PathClick(edtPathNFE);
end;

procedure Tfrmsetacbr.sbtnCaminhoCertClick(Sender: TObject);
begin
  OpenDialog1.Title      := 'Selecione o Certificado';
  OpenDialog1.DefaultExt := '*.pfx';
  OpenDialog1.Filter     := 'Arquivos PFX (*.pfx)|*.pfx|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := ExtractFileDir(application.ExeName);
  if OpenDialog1.Execute then
  begin
    edtCaminho.Text := OpenDialog1.FileName;
  end;
end;

procedure Tfrmsetacbr.sbtnGetCertClick(Sender: TObject);
begin
  edtNumSerie.Text := ACBrNFe1.SSL.SelecionarCertificado;
end;

procedure Tfrmsetacbr.sbtnLogoMarcaClick(Sender: TObject);
begin
  OpenDialog1.Title      := 'Selecione o Logo';
  OpenDialog1.DefaultExt := '*.bmp';
  OpenDialog1.Filter     := 'Arquivos BMP (*.bmp)|*.bmp|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := ExtractFileDir(application.ExeName);
  if OpenDialog1.Execute then
  begin
    edtLogoMarca.Text := OpenDialog1.FileName;
  end;
end;

procedure Tfrmsetacbr.sbtnPathSalvarClick(Sender: TObject);
begin
  PathClick(edtPathLogs);
end;

procedure Tfrmsetacbr.AtualizaSSLLibsCombo;
begin
  cbSSLLib.ItemIndex     := Integer(ACBrNFe1.Configuracoes.Geral.SSLLib);
  cbCryptLib.ItemIndex   := Integer(ACBrNFe1.Configuracoes.Geral.SSLCryptLib);
  cbHttpLib.ItemIndex    := Integer(ACBrNFe1.Configuracoes.Geral.SSLHttpLib);
  cbXmlSignLib.ItemIndex := Integer(ACBrNFe1.Configuracoes.Geral.SSLXmlSignLib);
  cbSSLType.Enabled      := (ACBrNFe1.Configuracoes.Geral.SSLHttpLib in [httpWinHttp, httpOpenSSL]);
end;

procedure Tfrmsetacbr.Button10Click(Sender: TObject);
begin
 ShowMessage(ACBrNFe1.SSL.CertIssuerName + sLineBreak + sLineBreak + 'Certificadora: '+ACBrNFe1.SSL.CertCertificadora);
end;

procedure Tfrmsetacbr.Button1Click(Sender: TObject);
begin
  ShowMessage(FormatDateBr(ACBrNFe1.SSL.CertDataVenc) );
end;

procedure Tfrmsetacbr.Button3Click(Sender: TObject);
begin
  ShowMessage(ACBrNFe1.SSL.CertSubjectName + sLineBreak + sLineBreak + 'Razão Social: '+ACBrNFe1.SSL.CertRazaoSocial);
end;

procedure Tfrmsetacbr.Button4Click(Sender: TObject);
begin
  ShowMessage( ACBrNFe1.SSL.CertCNPJ );
end;

procedure Tfrmsetacbr.actsalvarExecute(Sender: TObject);
begin
  if cbformaemissao.ItemIndex in [1, 5, 6, 7] then
  begin
    if memdscontingencia.Lines.Text = '' then
    begin
      MessageDlg('Justificativa de Contingência é um campo obrigatório'#13'quando forma de emissão for '+cbformaemissao.Text+'.', mtInformation, [mbok], 0);
      memdscontingencia.SetFocus;
      abort;
    end;
    if Length(memdscontingencia.Lines.Text) < 15 then
    begin
      MessageDlg('Justificativa de Contingência deve ter no mínimo 15 caracteres.'#13'Preencha para poder continuar.', mtInformation, [mbok], 0);
      memdscontingencia.SetFocus;
      abort;
    end;
  end;
  ModalResult := mrOk;
  GravarConfiguracao;
end;

procedure Tfrmsetacbr.cbCryptLibChange(Sender: TObject);
begin
  try
    if cbCryptLib.ItemIndex <> -1 then
    begin
      ACBrNFe1.Configuracoes.Geral.SSLCryptLib := TSSLCryptLib(cbCryptLib.ItemIndex);
    end;
  finally
    AtualizaSSLLibsCombo;
  end;
end;

procedure Tfrmsetacbr.cbHttpLibChange(Sender: TObject);
begin
  try
    if cbHttpLib.ItemIndex <> -1 then
    begin
      ACBrNFe1.Configuracoes.Geral.SSLHttpLib := TSSLHttpLib(cbHttpLib.ItemIndex);
    end;
  finally
    AtualizaSSLLibsCombo;
  end;
end;

procedure Tfrmsetacbr.cbSSLLibChange(Sender: TObject);
begin
  try
    if cbSSLLib.ItemIndex <> -1 then
    begin
      ACBrNFe1.Configuracoes.Geral.SSLLib := TSSLLib(cbSSLLib.ItemIndex);
    end;
  finally
    AtualizaSSLLibsCombo;
  end;
end;

procedure Tfrmsetacbr.cbSSLTypeChange(Sender: TObject);
begin
  if cbSSLType.ItemIndex <> -1 then
  begin
    ACBrNFe1.SSL.SSLType := TSSLType(cbSSLType.ItemIndex);
  end;
end;

procedure Tfrmsetacbr.cbxformaemissaoPropertiesChange(Sender: TObject);
begin
  lbldscontingencia.Visible := cbformaemissao.ItemIndex in [1, 2, 5, 6, 7];
  memdscontingencia.Visible := cbformaemissao.ItemIndex in [1, 2, 5, 6, 7];
  if not (cbformaemissao.ItemIndex in [1, 2, 5, 6, 7]) then
  begin
    memdscontingencia.Clear;
  end;
end;

procedure Tfrmsetacbr.cbXmlSignLibChange(Sender: TObject);
begin
  try
    if cbXmlSignLib.ItemIndex <> -1 then
    begin
      ACBrNFe1.Configuracoes.Geral.SSLXmlSignLib := TSSLXmlSignLib(cbXmlSignLib.ItemIndex);
    end;
  finally
    AtualizaSSLLibsCombo;
  end;
end;

procedure Tfrmsetacbr.cbxSalvarArqsClick(Sender: TObject);
begin
  LimparPastaArquivos;
end;

procedure Tfrmsetacbr.FormCreate(Sender: TObject);
var
  T : TSSLLib;
  I : TpcnTipoEmissao ;
  J : TpcnModeloDF;
  K : TpcnVersaoDF;
  U: TSSLCryptLib;
  V: TSSLHttpLib;
  X: TSSLXmlSignLib;
  Y: TSSLType;
begin
  acbr := tacbr.create;
  cbSSLLib.Items.Clear ;
  For T := Low(TSSLLib) to High(TSSLLib) do
  begin
    cbSSLLib.Items.Add( GetEnumName(TypeInfo(TSSLLib), integer(T) ) ) ;
  end;
  cbSSLLib.ItemIndex := 0 ;

  cbCryptLib.Items.Clear ;
  For U := Low(TSSLCryptLib) to High(TSSLCryptLib) do
  begin
    cbCryptLib.Items.Add( GetEnumName(TypeInfo(TSSLCryptLib), integer(U) ) ) ;
  end;
  cbCryptLib.ItemIndex := 0 ;

  cbHttpLib.Items.Clear ;
  For V := Low(TSSLHttpLib) to High(TSSLHttpLib) do
  begin
    cbHttpLib.Items.Add( GetEnumName(TypeInfo(TSSLHttpLib), integer(V) ) ) ;
  end;
  cbHttpLib.ItemIndex := 0 ;

  cbXmlSignLib.Items.Clear ;
  For X := Low(TSSLXmlSignLib) to High(TSSLXmlSignLib) do
  begin
    cbXmlSignLib.Items.Add( GetEnumName(TypeInfo(TSSLXmlSignLib), integer(X) ) ) ;
  end;
  cbXmlSignLib.ItemIndex := 0 ;

  cbSSLType.Items.Clear ;
  For Y := Low(TSSLType) to High(TSSLType) do
  begin
    cbSSLType.Items.Add( GetEnumName(TypeInfo(TSSLType), integer(Y) ) ) ;
  end;
  cbSSLType.ItemIndex := 0 ;

  cbFormaEmissao.Items.Clear ;
  For I := Low(TpcnTipoEmissao) to High(TpcnTipoEmissao) do
  begin
    cbFormaEmissao.Items.Add( GetEnumName(TypeInfo(TpcnTipoEmissao), integer(I) ) ) ;
  end;
  cbFormaEmissao.Items[0] := 'teNormal' ;
  cbFormaEmissao.ItemIndex := 0 ;

  cbModeloDF.Items.Clear ;
  For J := Low(TpcnModeloDF) to High(TpcnModeloDF) do
  begin
    cbModeloDF.Items.Add( GetEnumName(TypeInfo(TpcnModeloDF), integer(J) ) ) ;
  end;
  cbModeloDF.Items[0] := 'moNFe' ;
  cbModeloDF.ItemIndex := 0 ;

  cbVersaoDF.Items.Clear ;
  For K := Low(TpcnVersaoDF) to High(TpcnVersaoDF) do
  begin
    cbVersaoDF.Items.Add( GetEnumName(TypeInfo(TpcnVersaoDF), integer(K) ) ) ;
  end;
  cbVersaoDF.Items[0] := 've200' ;
  cbVersaoDF.ItemIndex := 0 ;

  LerConfiguracao;
  ACBrNFe1.Configuracoes.WebServices.Salvar := true;
  LimparTreeView;
end;

procedure Tfrmsetacbr.LimparTreeView;
begin
  if not empresa.faturamento.cte.bo then
  begin
    ExcluirNoTreview('Arquivos CTE');
    ExcluirNoTreview('Geral CTE');
  end;
  if not empresa.faturamento.mdfe.Bo then
  begin
    ExcluirNoTreview('Arquivos MDFE');
    ExcluirNoTreview('Geral MDFE');
  end;
  if not empresa.faturamento.saida.bo then
  begin
    ExcluirNoTreview('Arquivos NFE');
    ExcluirNoTreview('Geral NFE');
  end;
end;

procedure Tfrmsetacbr.ExcluirNoTreview(value:string);
var
  i : Integer;
  no : TTreeNode;
begin
  for I := 0 to trv.Items.Count - 1 do
  begin
    if trv.Items[i].Text = value then
    begin
      no := trv.Items[i];
      trv.Items.Delete(no);
      Break;
    end;
  end;
end;

procedure Tfrmsetacbr.FormDestroy(Sender: TObject);
begin
  freeandnil(acbr);
end;

procedure Tfrmsetacbr.rdgtpenvioPropertiesChange(Sender: TObject);
begin
  edtSmtpUser.Enabled     := rdgtpenvio.ItemIndex <> 0;
  edtSmtpPass.Enabled     := rdgtpenvio.ItemIndex <> 0;
  edtEmailAssunto.Enabled := rdgtpenvio.ItemIndex <> 0;
  ckbEmailSSL.Enabled     := rdgtpenvio.ItemIndex <> 0;
  ckbenviarpdf.Enabled    := rdgtpenvio.ItemIndex <> 0;
  memEmailMsg.Enabled     := rdgtpenvio.ItemIndex <> 0;
  edtSmtpPort.enabled := (rdgtpenvio.ItemIndex <> 1) and (rdgtpenvio.ItemIndex <> 2) and (rdgtpenvio.ItemIndex <> 3);
  edtSmtpHost.enabled := (rdgtpenvio.ItemIndex <> 1) and (rdgtpenvio.ItemIndex <> 2) and (rdgtpenvio.ItemIndex <> 3);
  if rdgtpenvio.ItemIndex = 1 then
  begin
    edtSmtpPort.Text := _465;
    edtSmtpHost.Text := _smtp_gmail_com;
  end
  else if rdgtpenvio.ItemIndex = 2 then
  begin
    edtSmtpPort.Text := _587;
    edtSmtpHost.Text := _smtp_live_com;
  end
  else if rdgtpenvio.ItemIndex = 3 then
  begin
    edtSmtpPort.Text := _587;
    edtSmtpHost.Text := _smtp_uol_com_br;
  end
  else
  begin
    //edtSmtpPort.Clear;
    //edtSmtpHost.clear;
  end;
end;

end.
