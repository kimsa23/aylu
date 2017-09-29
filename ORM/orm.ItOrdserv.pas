unit orm.ItOrdserv;

interface

uses Classe.DAO;

type
  TItOrdserv = class(TRegistroQuipos)
  private
    Fvldesconto: currency;
    Fcdformulacao: integer;
    Fvlunitario: currency;
    Ftsfim: TDateTime;
    Fdsobservacao: string;
    Fnmitordserv: string;
    Fcdstitordserv: integer;
    Ftsinicio: TDateTime;
    Fnupesagem: string;
    Fqtitem: double;
    Fcddigitado: string;
    Fcdunidade: integer;
    Fcditetapa: integer;
    Fvltotal: currency;
    Fprdesconto: double;
    Fcditordserv: integer;
    Fqtagua: double;
    Fcdproduto: integer;
    Fcdordserv: integer;
    Fnutemperatura: double;
    Fcdtpgradevalor: integer;
    Fcdgarantia: integer;
    Fcdequipamento: integer;
    Fnuvibracao: double;
  public
    [keyfield]
    property cditordserv : integer read Fcditordserv write Fcditordserv;
    [fk]
    property cdordserv : integer read Fcdordserv write Fcdordserv;
    [fk]
    property cdequipamento : integer read Fcdequipamento write Fcdequipamento;
    [fk]
    property cdstitordserv : integer read Fcdstitordserv write Fcdstitordserv;
    [fk]
    property cdgarantia : integer read Fcdgarantia write Fcdgarantia;
    [fk]
    property cdunidade : integer read Fcdunidade write Fcdunidade;
    [fk]
    property cdproduto : integer read Fcdproduto write Fcdproduto;
    [fk]
    property cditetapa : integer read Fcditetapa write Fcditetapa;
    [fk]
    property cdtpgradevalor : integer read Fcdtpgradevalor write Fcdtpgradevalor;
    property cddigitado : string read Fcddigitado write Fcddigitado;
    property vlunitario : currency read Fvlunitario write Fvlunitario;
    property qtitem : double read Fqtitem write Fqtitem;
    property prdesconto : double read Fprdesconto write Fprdesconto;
    property vldesconto : currency read Fvldesconto write Fvldesconto;
    property vltotal : currency read Fvltotal write Fvltotal;
    property nmitordserv : string read Fnmitordserv write Fnmitordserv;
    property dsobservacao : string read Fdsobservacao write Fdsobservacao;
    property nupesagem : string read Fnupesagem write Fnupesagem;
    property qtagua : double read Fqtagua write Fqtagua;
    property nutemperatura : double read Fnutemperatura write Fnutemperatura;
    property nuvibracao : double read Fnuvibracao write Fnuvibracao;
    [fk]
    property cdformulacao : integer read Fcdformulacao write Fcdformulacao;
    property tsinicio : TDateTime read Ftsinicio write Ftsinicio;
    property tsfim : TDateTime read Ftsfim write Ftsfim;
  end;

implementation

end.
