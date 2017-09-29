unit ORM.PedidoMaterial;

interface

uses
  sysutils, Controls, Contnrs, DB, Classes,
  rotina.strings, uConstantes, rotina.Registro, rotina.datahora,
  dialogo.justificativa,
  classe.query, classe.aplicacao, orm.empresa, rotina.retornasql,
  classe.gerar, orm.HStPedidoMaterial, orm.usuario, classe.executasql,
  orm.TpPedidoMaterial, orm.produto, orm.StPedidoMaterial, classe.dao,
  orm.ItPedidoMaterial, orm.ItPedidoMaterialFornecedor, orm.PedidoMaterialFornecedor;

type
  TPedidoMaterial = class(TRegistroQuipos)
  private
    Fboexclusivo: String;
    Fbosemcotacao: String;
    Fvltotal: Currency;
    Fcdstpedidomaterial: integer;
    Fcdfuncionariocomprador: Integer;
    Fcdtppedidomaterial: Integer;
    Fcdtpaplicacao: Integer;
    Fcdpedidomaterial: Integer;
    Fcdfuncionariosolicitante: Integer;
    Fcdfinalidadeordcompra: Integer;
    Fcdtpfornecedor: Integer;
    Fdsaplicacao: string;
    Fdsobservacaointerna: string;
    Fdsobservacao: string;
    Fdtemprego: TDate;
    Fdtemissao: TDate;
    Ftppedidomaterial: TTpPedidoMaterial;
    FItPedidoMaterial : TItPedidoMaterialList;
    FPedidoMaterialFornecedor : TPedidoMaterialFornecedorList;
    Fstpedidomaterial: tstpedidomaterial;
    Fcdusuarioaprovador: integer;
  public
    property tppedidomaterial : ttppedidomaterial read Ftppedidomaterial write Ftppedidomaterial;
    property stpedidomaterial : tstpedidomaterial read Fstpedidomaterial write Fstpedidomaterial;
    property ItPedidoMaterial : TItPedidoMaterialList read FItPedidoMaterial write FItPedidoMaterial;
    property PedidoMaterialFornecedor : TPedidoMaterialFornecedorList read FPedidoMaterialFornecedor write FPedidoMaterialFornecedor;
    [keyfield]
    property cdpedidomaterial : Integer read Fcdpedidomaterial write Fcdpedidomaterial;
    [fk]
    property cdtppedidomaterial : Integer read Fcdtppedidomaterial write Fcdtppedidomaterial;
    [fk]
    property cdstpedidomaterial : integer read Fcdstpedidomaterial write Fcdstpedidomaterial;
    [fk]
    property cdfuncionariosolicitante : Integer read Fcdfuncionariosolicitante write Fcdfuncionariosolicitante;
    [fk]
    property cdtpaplicacao : Integer read Fcdtpaplicacao write Fcdtpaplicacao;
    [fk]
    property cdfinalidadeordcompra : Integer read Fcdfinalidadeordcompra write Fcdfinalidadeordcompra;
    [fk]
    property cdtpfornecedor : Integer read Fcdtpfornecedor write Fcdtpfornecedor;
    [fk]
    property cdfuncionariocomprador : Integer read Fcdfuncionariocomprador write Fcdfuncionariocomprador;
    property dtemissao : TDate read Fdtemissao write Fdtemissao;
    property dtemprego : TDate read Fdtemprego write Fdtemprego;
    property vltotal : Currency read Fvltotal write Fvltotal;
    property dsobservacao : string read Fdsobservacao write Fdsobservacao;
    property dsaplicacao : string read Fdsaplicacao write Fdsaplicacao;
    property boexclusivo : String read Fboexclusivo write Fboexclusivo;
    property bosemcotacao : String read Fbosemcotacao write Fbosemcotacao;
    property dsobservacaointerna : string read Fdsobservacaointerna write Fdsobservacaointerna;
    property cdusuarioaprovador : integer read Fcdusuarioaprovador write Fcdusuarioaprovador;
    constructor create;
    destructor destroy; override;
    function Enviar_Email_Cotacao(codigo:integer; email: string):boolean;
    function SetStatus(cdstatus: integer): Boolean;
    function RegistrarMudancaStatus(cdstatus: integer): boolean;
  end;

implementation

uses dialogo.RichEdit, dialogo.AssinaturaDigital, orm.eventoemail;

constructor TPedidoMaterial.create;
begin
  inherited;
  fstpedidomaterial := tstpedidomaterial.create;
  ftppedidomaterial := ttppedidomaterial.create;
  FItPedidoMaterial := TitpedidomaterialList.create;
  FPedidoMaterialFornecedor := TPedidoMaterialFornecedorList.Create;
end;

destructor TPedidoMaterial.destroy;
begin
  freeandnil(fstpedidomaterial);
  FreeAndNil(ftppedidomaterial);
  FreeAndNil(fitpedidomaterial);
  FreeAndNil(fpedidomaterialfornecedor);
  inherited;
end;

function TPedidoMaterial.Enviar_Email_Cotacao(codigo: integer; email: string): boolean;
var
  texto : TStrings;
  eventoemail : teventoemail;
  parametro : TPFormatarEmail;
begin
  texto       := TStringlist.create;
  eventoemail := teventoemail.create;
  try
    eventoemail.select(tppedidomaterial.cdeventoemail);
    eventoemail.dssql           := StringParametro(eventoemail.dssql, 'where pedidomaterialfornecedor.cdempresa='+cdempresa.tostring+' and pedidomaterialfornecedor.cdpedidomaterialfornecedor='+codigo.tostring);
    texto.text                  := eventoemail.trataremail(cdpedidomaterial);
    parametro.boexcluir_arquivo := False;
    parametro.dstitulo          := 'Cotação '+inttostr(cdpedidomaterial);
    parametro.dsassunto         := texto.text;
    parametro.lista_arquivo     := '';
    parametro.email             := email;
    parametro.listaemail        := '';
    parametro.nmusuario         := '';
    parametro.dssenha           := '';
    parametro.tpenvio           := '';
    parametro.nmtabela          := 'Cotação';
    parametro.cdtabela          := inttostr(cdpedidomaterial);
    parametro.bodireto          := false;
    Formatar_Email(parametro);
    result := true;
  finally
    freeandnil(texto);
    freeandnil(eventoemail);
  end;
end;

function TPedidoMaterial.RegistrarMudancaStatus(cdstatus: integer): boolean;
var
  hstpedidomaterial : thstpedidomaterial;
  dsjustificativa : string;
begin
  hstpedidomaterial := thstpedidomaterial.create;
  try
    if cdstatus = 7 then
    begin
      cdusuarioaprovador := AssinaturaDigital(3);
      if cdusuarioaprovador = 0 then
      begin
        result := false;
        exit;
      end;
    end;
    if tppedidomaterial.bojustificarmudancastatus = _s then
    begin
      dialogojustificativa('Justificar mudança de status', dsjustificativa);
    end;
    hstpedidomaterial.cdhstpedidomaterial := qgerar.GerarCodigo(_hstpedidomaterial);
    hstpedidomaterial.cdpedidomaterial    := cdpedidomaterial;
    hstpedidomaterial.cdstpedidomaterial  := cdstatus;
    hstpedidomaterial.cdusuario           := usuario.cdusuario;
    hstpedidomaterial.cdcomputador        := strtoint(vgcdcomputador);
    hstpedidomaterial.cdempresa           := Empresa.cdempresa;
    hstpedidomaterial.tshistorico         := tsBanco;
    hstpedidomaterial.dsjustificativa     := dsjustificativa;
    result                                := ExecutaSQL(hstpedidomaterial.Insert(true));
  finally
    freeandnil(hstpedidomaterial);
  end;
end;

function TPedidoMaterial.SetStatus(cdstatus: Integer): Boolean;
begin
  cdstpedidomaterial := cdstatus;
  result             := Registrarmudancastatus(cdstpedidomaterial);
  if result then
  begin
    Update;
  end;
end;

end.
