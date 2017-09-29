unit ORM.Embarque;

interface

uses
  System.Actions, System.UITypes,
  controls, SysUtils, Contnrs, DB, dialogs,
  classe.query, rotina.RetornaSql, orm.transportadora, orm.empresa, classe.dao,
  classe.gerar,
  orm.rota, orm.Veiculo, orm.TpEmbarque, orm.itembarque,
  uconstantes, rotina.strings;

Type
  TEmbarque = class(TRegistroQuipos)
    private
      FItembarque: TItembarqueList;
      fmsgerro : string;
      ftransportadora: ttransportadora;
      fvlavgfretepeso : Currency;
      ftpembarque : ttpembarque;
      fcdembarque : Integer;
      fcdtpembarque : Integer;
      fcdstembarque : Integer;
      fcdtransportadora : Largeint;
      fcdrpa : Integer;
      fcdmdfe : Integer;
      fcdrota : Integer;
      fdtemissao : TDate;
      fvlfrete : Currency;
      Fcdveiculo: integer;
      Fqtentrega: integer;
      procedure clear;
      procedure setcdtransportadora(const Value: Largeint);
      function getqtentrega: integer;
    public
      property tpembarque : ttpembarque read ftpembarque write ftpembarque;
      property Itembarque : TItembarqueList read FItembarque write FItembarque;
      property transportadora : ttransportadora read ftransportadora write Ftransportadora;
      property msgerro : string read fmsgerro write fmsgerro;
      [keyfield]
      property cdembarque : Integer read fcdembarque write fcdembarque;
      [fk]
      property cdtpembarque : integer read fcdtpembarque write fcdtpembarque;
      [fk]
      property cdstembarque : Integer read fcdstembarque write fcdstembarque;
      [fk]
      property cdtransportadora : Largeint read fcdtransportadora write setcdtransportadora;
      [fk]
      property cdveiculo : integer read Fcdveiculo write fcdveiculo;
      property qtentrega : integer read getqtentrega write fqtentrega;
      [fk]
      property cdrpa : Integer read fcdrpa write fcdrpa;
      [fk]
      property cdmdfe : Integer read fcdmdfe write fcdmdfe;
      [fk]
      property cdrota : Integer read fcdrota write fcdrota;
      property dtemissao : TDate read fdtemissao write fdtemissao;
      property vlfrete : Currency read fvlfrete write fvlfrete;
      property vlavgfretepeso : Currency read fvlavgfretepeso write fvlavgfretepeso;
      constructor create;
      destructor  destroy; override;
      function    get_vlfretepeso:Currency;
      function    check_campo_obrigatorio:boolean;
      procedure   Novo;
  end;

implementation

uses Classes;

function TEmbarque.check_campo_obrigatorio:boolean;
begin
  result := false;
  if cdtpembarque = 0 then
  begin
    MessageDlg('Tipo é um campo obrigatório.', mtInformation, [mbOK], 0);
    exit;
  end;
  if cdtransportadora = 0 then
  begin
    MessageDlg('Transportadora é um campo obrigatório.', mtInformation, [mbOK], 0);
    exit;
  end;
  result := true;
end;

constructor TEmbarque.create;
begin
  inherited create;
  ftransportadora := ttransportadora.create;
  ftpembarque := TTpEmbarque.create;
  fitembarque := titembarqueList.create;
end;

destructor TEmbarque.destroy;
begin
  FreeAndNil(fItembarque);
  freeandnil(ftransportadora);
  FreeAndNil(ftpembarque);
  inherited;
end;

function TEmbarque.get_vlfretepeso: Currency;
var
  rota : TRota;
begin
  rota := tRota.create;
  try
    rota.cdrota := cdrota;
    result := rota.get_vlfretepeso(qtentrega);
  finally
    freeandnil(rota);
  end;
end;

procedure TEmbarque.setcdtransportadora(const Value: Largeint);
var
  veiculo : tveiculo;
begin
  if (state = dsInsert) or (state = dsedit) then
  begin
    veiculo := tveiculo.create;
    try
      if not transportadora.Select(value) then
      begin
        msgerro := Format(_msg_codigo_inexistente_na_tabela, [value.ToString, qstring.maiuscula(_transportadora)]);
        exit;
      end;
      if transportadora.cdveiculo = 0 then
      begin
        msgerro := 'Transportadora não possui veículo cadastrado.';
        exit;
      end;
      veiculo.Select(transportadora.cdveiculo);
      if veiculo.cdtransportadora = 0 then
      begin
        msgerro := 'Veículo da Transportadora não possui proprietário.';
        exit;
      end;
      cdveiculo := transportadora.cdveiculo;
    finally
      freeandnil(veiculo);
    end;
  end;
  fcdtransportadora := value;
end;

function TEmbarque.getqtentrega: integer;
begin
  result := itembarque.get_qtembarque;
end;

procedure TEmbarque.Novo;
begin
  clear;
  itembarque.clear;
  state := dsinsert;
end;

procedure TEmbarque.clear;
begin
  cdusuarioi       := 0;
  cdusuarioa       := 0;
  cdcomputadori    := 0;
  cdcomputadora    := 0;
  tsinclusao       := 0;
  tsalteracao      := 0;
  cdempresa        := 0;
  fcdembarque       := 0;
  fcdtpembarque     := 0;
  fcdstembarque     := 0;
  fcdtransportadora := 0;
  fcdveiculo        := 0;
  fqtentrega        := 0;
  fcdrpa            := 0;
  fcdmdfe           := 0;
  fcdrota           := 0;
  fdtemissao        := 0;
  fvlfrete          := 0;
  fvlavgfretepeso   := 0;
end;

end.
