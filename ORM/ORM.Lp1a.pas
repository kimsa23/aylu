unit ORM.Lp1a;

interface

uses system.classes, data.db,
  Classe.Dao, Contnrs, sysutils,
  orm.Lp1aAtivoPisCofins, orm.Lp1aCiapi, orm.ItRegApuracao, orm.ItApuracao,
  orm.ItApuf, orm.ItUfp1a, orm.ItLp1a;

type
  TLp1a = class(TRegistroQuipos)
  private
    Fcdtpescrituracao: integer;
    Fqtenergia: double;
    Fnureciboanterior: string;
    Fvltributadaciapi: currency;
    Fdtfinal: TDate;
    Fvlsaidaciapi: currency;
    Fprcoeficienteciapi: double;
    Fvlfolhapagamento: currency;
    Fvlcofins: currency;
    Fcdlp1a: integer;
    Fnufuncionarios: integer;
    Fcdindicadorsituacaoespecial: integer;
    Fdtinicio: TDate;
    Fitlp1a: Titlp1alist;
    FItUfp1a: TItUfp1aList;
    FItApuf: TItApufList;
    Fitapuracao: TItapuracaoList;
    Fitregapuracao: titregapuracaolist;
    Flp1aciapi: tlp1aciapilist;
    FLp1aAtivoPisCofins: TLp1aAtivoPisCofinsList;
  public
    property Lp1aAtivoPisCofins : TLp1aAtivoPisCofinsList read FLp1aAtivoPisCofins write FLp1aAtivoPisCofins;
    property lp1aciapi : tlp1aciapilist read Flp1aciapi write Flp1aciapi;
    property itregapuracao : titregapuracaolist read Fitregapuracao write Fitregapuracao;
    property itapuracao : TItapuracaoList read Fitapuracao write Fitapuracao;
    property ItApuf : TItApufList read FItApuf write FItApuf;
    property ItUfp1a : TItUfp1aList read FItUfp1a write FItUfp1a;
    property itlp1a : Titlp1alist read Fitlp1a write Fitlp1a;
    [keyfield]
    property cdlp1a : integer read Fcdlp1a write Fcdlp1a;
    [fk]
    property cdtpescrituracao : integer read Fcdtpescrituracao write Fcdtpescrituracao;
    [fk]
    property cdindicadorsituacaoespecial : integer read Fcdindicadorsituacaoespecial write Fcdindicadorsituacaoespecial;
    property dtinicio : TDate read Fdtinicio write Fdtinicio;
    property dtfinal : TDate read Fdtfinal write Fdtfinal;
    property nufuncionarios : integer read Fnufuncionarios write Fnufuncionarios;
    property vlfolhapagamento : currency read Fvlfolhapagamento write Fvlfolhapagamento;
    property vlcofins : currency read Fvlcofins write Fvlcofins;
    property qtenergia : double read Fqtenergia write Fqtenergia;
    property vltributadaciapi : currency read Fvltributadaciapi write Fvltributadaciapi;
    property vlsaidaciapi : currency read Fvlsaidaciapi write Fvlsaidaciapi;
    property prcoeficienteciapi : double read Fprcoeficienteciapi write Fprcoeficienteciapi;
    property nureciboanterior : string read Fnureciboanterior write Fnureciboanterior;
    constructor create;
    destructor destroy;
  end;

implementation

constructor TLp1a.create;
begin
  inherited;
  fLp1aAtivoPisCofins := TLp1aAtivoPisCofinslist.Create;
  flp1aciapi := tlp1aciapilist.create;
  fitregapuracao := titregapuracaolist.Create;
  fitapuracao := titapuracaolist.Create;
  FItApuf := TItApufList.Create;
  fitlp1a := titlp1alist.Create;
  FItUfp1a := TItUfp1aList.Create;
end;

destructor TLp1a.destroy;
begin
  freeandnil(fLp1aAtivoPisCofins);
  freeandnil(flp1aciapi);
  freeandnil(fitregapuracao);
  freeandnil(fitapuracao);
  freeandnil(FItApuf);
  freeandnil(fitlp1a);
  freeandnil(FItUfp1a);
  inherited;
end;

end.
