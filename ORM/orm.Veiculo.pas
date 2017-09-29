unit orm.Veiculo;

interface

uses System.SysUtils, Data.DB, Vcl.Dialogs, System.UITypes,
  uConstantes,
  pcnConversao, pcteConversaoCTe,
  classe.dao;

type
  TVeiculo = class(TRegistroQuipos)
  private
    Fnuhp: Double;
    Fnucilindradas: double;
    Fcdtpcombustivel: Integer;
    Fcdveiculo: Integer;
    Fcdmarca: Integer;
    Fcdmunicipio: Integer;
    Fcdstveiculo: Integer;
    Fcdmodelo: Integer;
    Fvlkm: Integer;
    Fcdtpveiculo: Integer;
    Fcdcntcusto: Integer;
    Fcdfuncionario: Integer;
    Fcduf: Integer;
    Fnueixos: Integer;
    Fpstara: Integer;
    Fcdctetpproprietario: Integer;
    Fnuano: Integer;
    Fcdcor: Integer;
    Fcdctetpveiculo: Integer;
    Fpscapacidade: Integer;
    Fpscapacidadem3: Integer;
    Fnudcr: string;
    Fcdctetprodado: string;
    Fdsmodelo: string;
    Fcdctetpcarroceria: string;
    Fcdtransportadora: Largeint;
    Fdsobservacao: string;
    Fnurntrc: string;
    Fnurenavam: string;
    Fnuplaca: string;
    Fnuchassi: string;
    Fnumotor: string;
  public
    [keyfield]
    property cdveiculo : Integer read Fcdveiculo write fcdveiculo;
    [fk]
    property cdtpveiculo : Integer read Fcdtpveiculo write fcdtpveiculo;
    [fk]
    property cdstveiculo : Integer read Fcdstveiculo write fcdstveiculo;
    [fk]
    property cdmarca : Integer read Fcdmarca write fcdmarca;
    [fk]
    property cdcor : Integer read Fcdcor write fcdcor;
    [fk]
    property cdtpcombustivel : Integer read Fcdtpcombustivel write fcdtpcombustivel;
    [fk]
    property cduf : Integer read Fcduf write fcduf;
    [fk]
    property cdmunicipio : Integer read Fcdmunicipio write fcdmunicipio;
    [fk]
    property cdtransportadora : largeint read Fcdtransportadora write fcdtransportadora;
    [fk]
    property cdmodelo : Integer read Fcdmodelo write fcdmodelo;
    [fk]
    property cdctetprodado :string read Fcdctetprodado write fcdctetprodado;
    [fk]
    property cdctetpcarroceria : string read Fcdctetpcarroceria write fcdctetpcarroceria;
    [fk]
    property cdctetpveiculo : Integer read Fcdctetpveiculo write fcdctetpveiculo;
    [fk]
    property cdcntcusto : Integer read Fcdcntcusto write fcdcntcusto;
    [fk]
    property cdfuncionario : Integer read Fcdfuncionario write fcdfuncionario;
    [fk]
    property cdctetpproprietario : Integer read Fcdctetpproprietario write fcdctetpproprietario;
    property nuplaca : string read Fnuplaca write fnuplaca;
    property vlkm : Integer read Fvlkm write fvlkm;
    property dsobservacao : string read Fdsobservacao write fdsobservacao;
    property nurntrc : string read Fnurntrc write fnurntrc;
    property numotor : string read Fnumotor write fnumotor;
    property nuano : Integer read Fnuano write fnuano;
    property dsmodelo : string read Fdsmodelo write fdsmodelo;
    property nuchassi : string read Fnuchassi write fnuchassi;
    property nurenavam : string read Fnurenavam write fnurenavam;
    property nucilindradas : double read Fnucilindradas write fnucilindradas;
    property nuhp : Double read Fnuhp write fnuhp;
    property nudcr : string read Fnudcr write fnudcr;
    property pstara : Integer read Fpstara write fpstara;
    property pscapacidade : Integer read Fpscapacidade write fpscapacidade;
    property pscapacidadem3 : Integer read Fpscapacidadem3 write fpscapacidadem3;
    property nueixos : Integer read Fnueixos write fnueixos;
    procedure check_uf_veiculo;
    procedure check_rntrc_tamanho;
    procedure check_tpveiculo;
    procedure check_tprodado;
    procedure Check_tpproprietario;
    function gettpveiculo: TpcteTipoVeiculo;
    function gettprodado: TpcteTipoRodado;
    function gettpproprietario: TpcteProp;
  end;

implementation

procedure TVeiculo.check_rntrc_tamanho;
begin
  if Length(NURNTRC) > 8 then
  begin
    messagedlg('O número RNTRC do veículo '+nuplaca+' está maior do 8 caracteres.', mtInformation, [mbok], 0);
    abort;
  end;
end;

procedure TVeiculo.Check_tpproprietario;
begin
  if not cdctetpproprietario in [0, 1, 2] then
  begin
    messagedlg('Tipo de Proprietario não está definido no cadastro do veículo '+nuplaca+'.', mtInformation, [mbok], 0);
    abort;
  end;
end;

procedure TVeiculo.check_tprodado;
begin
  if (cdctetprodado <> _00) and (cdctetprodado = _01) and (cdctetprodado = _02) and (cdctetprodado <> _03) and (cdctetprodado <> _04) and (cdctetprodado <> _05) and (cdctetprodado <> _06) then
  begin
    messagedlg('Tipo de Rodado não está definido no cadastro do veículo '+nuplaca+'.', mtInformation, [mbok], 0);
    abort;
  end;
end;

procedure TVeiculo.check_tpveiculo;
begin
  if not cdtpveiculo in [0, 1] then
  begin
    messagedlg('Tipo de Veículo não definido no cadastro do veículo '+nuplaca+'.', mtInformation, [mbok], 0);
    abort;
  end;
end;

procedure TVeiculo.check_uf_veiculo;
begin
  if cduf = 0 then
  begin
    messagedlg('A UF não está definida no cadastro do veículo '+nuplaca+'.', mtInformation, [mbok], 0);
    abort;
  end;
end;

function TVeiculo.gettpproprietario: TpcteProp;
begin
  if cdctetpproprietario = 0 then
  begin
    result := tpTACAgregado
  end
  else if cdctetpproprietario = 1 then
  begin
    result := tpTACIndependente
  end
  else if cdctetpproprietario = 2 then
  begin
    result := tpOutros
  end;
end;

function TVeiculo.gettprodado: TpcteTipoRodado;
begin
  if cdctetprodado = _00 then
  begin
    result := trNaoAplicavel
  end
  else if cdctetprodado = _01 then
  begin
    result := trTruck
  end
  else if cdctetprodado = _02 then
  begin
    result := trToco
  end
  else if cdctetprodado = _03 then
  begin
    result := trCavaloMecanico
  end
  else if cdctetprodado = _04 then
  begin
    result := trVAN
  end
  else if cdctetprodado = _05 then
  begin
    result := trUtilitario
  end
  else if cdctetprodado = _06 then
  begin
    result := trOutros
  end;
end;

function TVeiculo.gettpveiculo: TpcteTipoVeiculo;
begin
  if cdtpveiculo = 0 then
  begin
    result := tvTracao
  end
  else if cdtpveiculo = 1 then
  begin
    result := tvReboque
  end;
end;

end.
