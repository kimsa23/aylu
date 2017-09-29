unit classe.email;

interface

uses Forms, Dialogs, SysUtils, ComObj, classes,
  ACBrNFeNotasFiscais, mimepart, mimemess,
  ACBrMail,
  DB, DBClient,
  classe.executasql, orm.empresa, classe.aplicacao,
  rotina.strings, uconstantes, rotina.datahora, classe.dao;

type
  TEmail_ = class
  private
    FboSSL: Boolean;
    FSmtpPort: string;
    FSmtpPass: string;
    Ftpenvio: Integer;
    Fmsg: string;
    FSmtpHost: string;
    FSmtpUser: string;
    Fbopdf: Boolean;
    FAssunto: string;
  public
    property tpenvio : Integer read Ftpenvio write Ftpenvio;
    property SmtpHost: string read FSmtpHost write FSmtpHost;
    property SmtpPort: string read FSmtpPort write FSmtpPort;
    property SmtpUser: string read FSmtpUser write FSmtpUser;
    property SmtpPass: string read FSmtpPass write FSmtpPass;
    property Assunto: string read FAssunto write FAssunto;
    property msg: string read Fmsg write Fmsg;
    property bopdf: Boolean read Fbopdf write Fbopdf;
    property boSSL: Boolean read FboSSL write FboSSL;
  end;
  TLogEmail  = class(TPersintentObject)
  private
    Fdstitulo: string;
    Fdsdestinatario: string;
    Fcdempresa: LargeInt;
    Fcdcomputador: integer;
    Fcdlogemail: integer;
    Fcdusuario: integer;
    Fdsanexo: string;
    Fdscc: string;
    Fcdtarefa: integer;
    Ftsregistro: TDateTime;
    Fdsmensagem: string;
  public
    [keyfield]
    property cdempresa : LargeInt read Fcdempresa write Fcdempresa;
    [keyfield]
    property cdlogemail: integer read Fcdlogemail write Fcdlogemail;
    [fk]
    property cdusuario : integer read Fcdusuario write Fcdusuario;
    [fk]
    property cdtarefa  : integer read Fcdtarefa write Fcdtarefa;
    [fk]
    property cdcomputador : integer read Fcdcomputador write Fcdcomputador;
    property tsregistro : TDateTime read Ftsregistro write Ftsregistro;
    property dsmensagem : string read Fdsmensagem write Fdsmensagem;
    property dsdestinatario : string read Fdsdestinatario write Fdsdestinatario;
    property dscc : string read Fdscc write Fdscc;
    property dstitulo : string read Fdstitulo write Fdstitulo;
    property dsanexo : string read Fdsanexo write Fdsanexo;
    function Insert(boscript:boolean=false): String;
    class procedure registrar_log_email(dsmensagem_, dsdestinatario_, dscc_, dstitulo_, dsanexo_, nmtabela, codigo:string);
  end;
  TEnviarEmail = class
  private
    Fnmusuario: string;
    Ftpenvio: string;
    Fdstitulo: string;
    Fdsdestinatario: string;
    Fbotexto: boolean;
    Fcodigo: string;
    Fnmtabela: string;
    Fdscc: string;
    Fdsanexo: TStrings;
    Fdssenha: string;
    Fnmremetente: string;
    Fboanexo: TStrings;
    Fboexcluir_arquivo: Boolean;
    Fdsmensagem: string;
    function get_dsanexo:string;
    function Enviar_outlook:boolean;
    Function Enviar_Gmail:boolean;
  public
    property botexto:boolean read Fbotexto write Fbotexto;
    property boexcluir_arquivo:Boolean read Fboexcluir_arquivo write Fboexcluir_arquivo;
    property dsanexo: TStrings read Fdsanexo write Fdsanexo;
    property boanexo:TStrings read Fboanexo write Fboanexo;
    property dsdestinatario: string read Fdsdestinatario write Fdsdestinatario;
    property dscc: string read Fdscc write Fdscc;
    property dstitulo : string read Fdstitulo write Fdstitulo;
    property dsmensagem:string read Fdsmensagem write Fdsmensagem;
    property nmremetente:string read Fnmremetente write Fnmremetente;
    property nmusuario : string read Fnmusuario write Fnmusuario;
    property dssenha:string read Fdssenha write Fdssenha;
    property tpenvio:string read Ftpenvio write Ftpenvio;
    property nmtabela:string read Fnmtabela write Fnmtabela;
    property codigo:string read Fcodigo write Fcodigo;
    constructor create;
    function enviar_email:boolean;
  end;
  TEnviarGmail = class(TComponent)
  private
    mail : TACBrMail;
    StreamNFe : TStringStream;
    dsmensagem1, sCC: TStrings;
    Fusuarioemail: string;
    FPedeConfirma: boolean;
    Ftpenvio: string;
    Fdstitulo: string;
    Fdsdestinatario: string;
    Fbotexto: boolean;
    FNomeRemetente: String;
    FAguardarEnvio: Boolean;
    Fdscc: string;
    Fdsanexo: TStrings;
    Fsenhaemail: string;
    FTLS: Boolean;
    Fboanexo: TStrings;
    Fboexcluir_arquivo: Boolean;
    Fdsmensagem: string;
    procedure adicionar_anexos;
    procedure excluir_arquivo_de_anexo;
    procedure SmtpUol;
    procedure SmtpGmail;
    procedure SmtpLive;
    procedure SmtpEmpresa;
    procedure ConfigurarSmtp;
    Function ObterFromName:string;
    Function ObterFrom:string;
    Function ObterUserName:string;
    function ObterPassword:string;
    procedure AdicionarCC;
  public
    property botexto : boolean read Fbotexto write Fbotexto;
    property boexcluir_arquivo: Boolean read Fboexcluir_arquivo write Fboexcluir_arquivo;
    property dsanexo : TStrings read Fdsanexo write Fdsanexo;
    property boanexo: TStrings read Fboanexo write Fboanexo;
    property dsdestinatario : string read Fdsdestinatario write Fdsdestinatario;
    property dscc : string read Fdscc write Fdscc;
    property dstitulo : string read Fdstitulo write Fdstitulo;
    property dsmensagem: string read Fdsmensagem write Fdsmensagem;
    property PedeConfirma : boolean read FPedeConfirma write FPedeConfirma;
    property AguardarEnvio: Boolean read FAguardarEnvio write FAguardarEnvio;
    property NomeRemetente: String read FNomeRemetente write FNomeRemetente;
    property TLS: Boolean read FTLS write FTLS;
    property usuarioemail : string read Fusuarioemail write Fusuarioemail;
    property senhaemail : string read Fsenhaemail write Fsenhaemail;
    property tpenvio: string read Ftpenvio write Ftpenvio;
    function enviar_gmail:boolean;
    constructor create;
    destructor destroy; override;
  end;
  TEnviarOutlook = class
  private
    vMailItem: variant;
    Fdstitulo: string;
    Fdsdestinatario: string;
    Fdscc: string;
    Fdsanexo: TStrings;
    Fboanexo: TStrings;
    Fboexcluir_arquivo: Boolean;
    Fdsmensagem: string;
    procedure anexar_arquivos;
    procedure excluir_arquivo_de_anexo;
  public
    property boexcluir_arquivo: Boolean read Fboexcluir_arquivo write Fboexcluir_arquivo;
    property dsanexo: TStrings read Fdsanexo write Fdsanexo;
    property boanexo: TStrings read Fboanexo write Fboanexo;
    property dsdestinatario: string read Fdsdestinatario write Fdsdestinatario;
    property dscc : string read Fdscc write Fdscc;
    property dstitulo : string read Fdstitulo write Fdstitulo;
    property dsmensagem: string read Fdsmensagem write Fdsmensagem;
    function enviar_outlook:boolean;
  end;

implementation

uses orm.usuario, classe.gerar;

function TLogEmail.Insert(boscript: boolean): String;
begin
  cdempresa    := empresa.cdempresa;
  cdlogemail   := qgerar.GerarCodigo(_log+_email);
  cdusuario    := usuario.cdusuario;
  cdcomputador := strtoint(vgcdcomputador);
  tsregistro   := tsbanco;
  result       := inherited insert(boscript);
end;

class procedure TLogEmail.registrar_log_email(dsmensagem_, dsdestinatario_, dscc_, dstitulo_, dsanexo_, nmtabela, codigo: string);
var
  logemail : TLogemail;
begin
  logemail := tlogemail.Create;
  try
    logemail.dsmensagem     := StringReplace(StringReplace( dsmensagem_, #0#$D#$A, '', [rfReplaceAll]), #$D#$A, '', [rfReplaceAll]) ;
    logemail.dsdestinatario := dsdestinatario_;
    logemail.dscc           := dscc_;
    logemail.dstitulo       := dstitulo_;
    logemail.dsanexo        := dsanexo_;
    if (nmtabela = _tarefa) and (codigo <> '') then
    begin
      logemail.cdtarefa := strtoint(codigo);
    end;
    logemail.insert;
  finally
    freeandnil(logemail);
  end;
end;

procedure TEnviarOutlook.anexar_arquivos;
var
  i : Integer;
begin
  for i := 0 to dsanexo.Count - 1 do
  begin
    vMailItem.Attachments.Add(dsanexo[i]);
  end;
end;

function TEnviarOutlook.enviar_outlook: boolean;
const
  olMailItem = 0;
var
  Outlook: OleVariant;
  i : Integer;
  lstemail:tstrings;
begin
  try
    Outlook := GetActiveOleObject(_Outlook_Application);
  except
    Outlook := CreateOleObject(_Outlook_Application);
  end;
  vMailItem := Outlook.CreateItem(olMailItem);

  lstemail := TStringList.Create;
  try
    prepararlista(lstemail, dsdestinatario, ';');
    if lstemail.count > 1 then
    begin
      dsdestinatario := lstemail[0];
    end;
    prepararlista(lstemail, dscc, ';');
    if lstemail.count = 1 then
    begin
      lstemail.Delete(0);
    end;
    for i := 0 to lstemail.count - 1 do
    begin
      vMailItem.Recipients.Add(lstemail[i]);
    end;
  finally
    FreeAndNil(lstemail);
  end;

  vMailItem.Recipients.Add(dsdestinatario);
  vMailItem.Subject  := dstitulo;
  vMailItem.htmlBody := dsmensagem;

  anexar_arquivos;
  vMailItem.Send;
  VarClear(Outlook);
  excluir_arquivo_de_anexo;
  result := true;
end;

procedure TEnviarOutlook.excluir_arquivo_de_anexo;
var
  i : Integer;
begin
  if not boexcluir_arquivo then
  begin
    Exit;
  end;
  for i := 0 to dsanexo.Count - 1 do
  begin
    if lowercase(boanexo[i]) = _sim then
    begin
      DeleteFile(dsanexo[i]);
    end;
  end;
end;

procedure TEnviarGmail.adicionar_anexos;
var
  i : Integer;
begin
  if (dsanexo = nil) or (dsanexo.Count = 0) then
  begin
    Exit;
  end;
  for i := 0 to dsanexo.Count - 1 do
  begin
    mail.AddAttachment(dsanexo[i]);
  end;
end;

constructor TEnviarGmail.create;
begin
  sCC           := TStringList.Create;
  dsmensagem1   := TStringList.Create;
  mail          := TACBrMail.Create(nil) ;  // Não Libera, pois usa FreeOnTerminate := True ;
  StreamNFe     := TStringStream.Create('');
  PedeConfirma  := False;
  AguardarEnvio := False;
  NomeRemetente := '';
  TLS           := True;
  usuarioemail  := '';
  senhaemail    := '';
  tpenvio       := '';
end;

destructor TEnviarGmail.destroy;
begin
  StreamNFe.Free ;
  FreeAndNil(sCC);
  FreeAndNil(dsmensagem1);
end;

procedure TEnviarGmail.AdicionarCC;
var
  i: Integer;
begin
  if sCC.Text = '' then
  begin
    exit;
  end;
  for i := 0 to scc.Count - 1 do
  begin
    mail.AddCC(sCC[i]);
  end;
end;

procedure TEnviarGmail.ConfigurarSmtp;
begin
  if tpenvio = '' then
  begin
    if Empresa = nil then
    begin
      SmtpGmail;
    end
    else if empresa.emailE.envio = _g then
    begin
      SmtpGmail;
    end
    else if Empresa.emailE.envio = _u then
    begin
      SmtpUol;
    end
    else if empresa.emaile.envio = _z then
    begin
      SmtpEmpresa;
    end
    else if empresa.emaile.envio = _h then
    begin
      SmtpLive;
    end;
  end
  else if tpenvio = _1 then
  begin
    SmtpGmail;
  end
  else if tpenvio = _3 then
  begin
    SmtpUol;
  end
  else
  begin
    SmtpLive;
  end;
end;

procedure TEnviarGmail.SmtpEmpresa;
begin
  mail.Host   := empresa.emaile.smtp;
  mail.Port   := inttostr(empresa.emaile.nuporta);
  mail.SetSSL := empresa.emaile.bossl;
  mail.SetTLS := not empresa.emaile.bossl;
end;

procedure TEnviarGmail.SmtpLive;
begin
  mail.Host   := _smtp_live_com;
  mail.Port   := _587;
  mail.SetSSL := false;
  mail.SetTLS := true;
end;

procedure TEnviarGmail.SmtpGmail;
begin
  mail.Host   := _smtp_gmail_com;
  mail.Port   := _465;
  mail.SetSSL := true;
  mail.SetTLS := TLS;
end;

procedure TEnviarGmail.SmtpUol;
begin
  mail.Host   := _smtp_uol_com_br;
  mail.Port   := _587;
  mail.SetSSL := false;
  mail.SetTLS := true;
end;

function TEnviarGmail.enviar_gmail: boolean;
begin
  prepararlista(sCC, dsdestinatario, ';');
  if scc.count > 1 then
  begin
    dsdestinatario := scc[0];
  end;
  prepararlista(sCC, dscc, ';');
  if scc.count = 1 then
  begin
    scc.Delete(0);
  end;
  dsmensagem1.Text := dsmensagem;
  if dsmensagem1.Text <> '' then
  begin
    mail.Body.Text := dsmensagem1.Text;
    mail.IsHTML    := not botexto;
  end;
  adicionar_anexos;
  mail.FromName            := ObterFromName;
  mail.Subject             := dstitulo;
  mail.ReadingConfirmation := PedeConfirma;
  mail.From                := ObterFrom;
  mail.AddAddress(dsdestinatario);
  AdicionarCC;
  mail.UserName := ObterUserName;
  mail.Password := ObterPassword;
  ConfigurarSmtp;
  mail.send;
  excluir_arquivo_de_anexo;
  result := true;
end;

procedure TEnviarGmail.excluir_arquivo_de_anexo;
var
  i : Integer;
begin
  if not boexcluir_arquivo then
  begin
    Exit;
  end;
  if dsanexo = nil then
  begin
    Exit;
  end;
  for i := 0 to dsanexo.Count - 1 do
  begin
    if  boanexo[i] <> __nao then
    begin
      DeleteFile(dsanexo[i]);
    end;
  end;
end;

function TEnviarGmail.ObterFrom: string;
begin
  if usuarioemail <> '' then
  begin
    result := usuarioemail;
  end
  else
  begin
    result := usuario.email_.SmtpUser;
  end;
end;

function TEnviarGmail.ObterFromName: string;
begin
  if Trim(NomeRemetente) <> '' then
  begin
    result := NomeRemetente;
  end
  else
  begin
    result := usuario.nmusuario;
  end;
end;

function TEnviarGmail.ObterPassword: string;
begin
  if usuarioemail <> '' then
  begin
    result := senhaemail;
  end
  else
  begin
    result := usuario.email_.SmtpPass;
  end;
end;

function TEnviarGmail.ObterUserName: string;
begin
  if usuarioemail <> '' then
  begin
    result := usuarioemail;
  end
  else
  begin
    result := usuario.email_.SmtpUser;
  end;
end;

constructor TEnviarEmail.create;
begin
  nmremetente := '';
  nmusuario   := '';
  dssenha     := '';
  tpenvio     :='';
  nmtabela    :='';
  codigo      := '';
end;

function TEnviarEmail.enviar_email: boolean;
begin
  if tpenvio = _0 then
  begin
    result := enviar_outlook
  end
  else if (tpenvio = _1) or (tpenvio = _2) then
  begin
    result := enviar_gmail;
  end
  else if empresa.emailE.envio = _o then
  begin
    result := enviar_outlook
  end
  else
  begin
    tpenvio := '';
    result := enviar_gmail;
  end;
  if result then
  begin
     tlogemail.registrar_log_email(dsmensagem, dsdestinatario, dscc, dstitulo, get_dsanexo, nmtabela, codigo);
  end;
end;

function TEnviarEmail.Enviar_Gmail: boolean;
var
  EnviarGmail : TEnviarGmail;
begin
  enviargmail := tenviargmail.create;
  try
    enviargmail.botexto        := botexto;
    enviargmail.boexcluir_arquivo := boexcluir_arquivo;
    enviargmail.dsanexo        := dsanexo;
    enviargmail.boanexo        := boanexo;
    enviargmail.dsdestinatario := dsdestinatario;
    enviargmail.dscc           := dscc;
    enviargmail.dstitulo       := dstitulo;
    enviargmail.dsmensagem     := dsmensagem;
    enviargmail.PedeConfirma   := False;
    enviargmail.AguardarEnvio  := false;
    enviargmail.NomeRemetente  := nmremetente;
    enviargmail.TLS            := true;
    enviargmail.usuarioemail   := nmusuario;
    enviargmail.senhaemail     := dssenha;
    enviargmail.tpenvio        := tpenvio;
    result                     := enviargmail.enviar_gmail
  finally
    freeandnil(enviargmail);
  end;
end;

function TEnviarEmail.Enviar_outlook: boolean;
var
  EnviarOutlook: TEnviarOutlook;
begin
  EnviarOutlook := TEnviarOutlook.Create;
  try
    EnviarOutlook.boexcluir_arquivo := boexcluir_arquivo;
    EnviarOutlook.dsanexo           := dsanexo;
    EnviarOutlook.boanexo           := boanexo;
    EnviarOutlook.dsdestinatario    := dsdestinatario;
    EnviarOutlook.dscc              := dscc;
    EnviarOutlook.dstitulo          := dstitulo;
    EnviarOutlook.dsmensagem        := dsmensagem;
    result                          := EnviarOutlook.enviar_outlook
  finally
    freeandnil(EnviarOutlook);
  end;
end;

function TEnviarEmail.get_dsanexo: string;
begin
  result := '';
  if dsanexo <> nil then
  begin
    result := dsanexo.text;
  end;
end;

end.
