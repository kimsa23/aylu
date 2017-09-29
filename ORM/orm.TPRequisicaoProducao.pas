unit orm.TPRequisicaoProducao;

interface

uses Classe.DAO;

type
  TTPRequisicaoProducao = class(TRegistroQuipos)
  private
    Fbojustificativastatus: string;
    Fcdtpordproducao: Integer;
    Fcdtprequisicaoproducao: Integer;
    Fcdfuncionario: Integer;
    Fnmtprequisicaoproducao: string;
  public
    [keyfield]
    property cdtprequisicaoproducao : Integer read Fcdtprequisicaoproducao write Fcdtprequisicaoproducao;
    property nmtprequisicaoproducao : string read Fnmtprequisicaoproducao write Fnmtprequisicaoproducao;
    [fk]
    property cdtpordproducao : Integer read Fcdtpordproducao write Fcdtpordproducao;
    [fk]
    property cdfuncionario : Integer read Fcdfuncionario write Fcdfuncionario;
    property bojustificativastatus : string read Fbojustificativastatus write Fbojustificativastatus;
  end;

implementation

end.
