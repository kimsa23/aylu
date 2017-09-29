unit orm.Stcondpagto;

interface

uses Classe.DAO;

type
  TStcondpagto = class(TPersintentObject)
  private
    Fbogerarentrada: string;
    Fnucor: integer;
    Fbogerarpedido: string;
    Fnmstcondpagto: string;
    Fboexcluir: string;
    Fbogerarinfo: string;
    Fbonovo: string;
    Fcdstcondpagto: integer;
    Fbogerarsaida: string;
    Fboalterar: string;
  public
    [keyfield]
    property cdstcondpagto : integer read Fcdstcondpagto write Fcdstcondpagto;
    property nmstcondpagto : string read Fnmstcondpagto write Fnmstcondpagto;
    property bonovo : string read Fbonovo write Fbonovo;
    property boalterar : string read Fboalterar write Fboalterar;
    property boexcluir : string read Fboexcluir write Fboexcluir;
    property bogerarinfo : string read Fbogerarinfo write Fbogerarinfo;
    property bogerarpedido : string read Fbogerarpedido write Fbogerarpedido;
    property bogerarsaida : string read Fbogerarsaida write Fbogerarsaida;
    property bogerarentrada : string read Fbogerarentrada write Fbogerarentrada;
    property nucor : integer read Fnucor write Fnucor;
  end;

implementation

end.
