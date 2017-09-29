unit orm.TpRim;

interface

uses Classe.DAO;

type
  TTpRim = class(TRegistroQuipos)
  private
    fcdtprim : Integer;
    fnmtprim : string;
    fboprodutoexibircdalternativo : String;
    fboprodutoexibirdslocalizacao : String;
    fbocntcustoobrigatorio : String;
    fboordproducao : String;
    fbodtprevista : String;
    fboitemdtprevista : String;
    fboaplicacaodigitar: String;
  public
    [keyfield]
    property cdtprim : Integer read fcdtprim write fcdtprim;
    property nmtprim : string read fnmtprim write fnmtprim;
    property boprodutoexibircdalternativo : String read fboprodutoexibircdalternativo write fboprodutoexibircdalternativo;
    property boprodutoexibirdslocalizacao : String read fboprodutoexibirdslocalizacao write fboprodutoexibirdslocalizacao;
    property bocntcustoobrigatorio : String read fbocntcustoobrigatorio write fbocntcustoobrigatorio;
    property boordproducao : String read fboordproducao write fboordproducao;
    property bodtprevista : String read fbodtprevista write fbodtprevista;
    property boitemdtprevista : String read fboitemdtprevista write fboitemdtprevista;
    property boaplicacaodigitar : String read fboaplicacaodigitar write fboaplicacaodigitar;
  end;

implementation

end.
