unit orm.STRequisicaoProducao;

interface

uses Classe.DAO;

type
  TSTRequisicaoProducao = class(TRegistroQuipos)
  private
    Fboexcluir: string;
    Fbogerarinfo: string;
    Fbonotificarsetorsolicitante: string;
    Fbonotificarsolicitante: string;
    Fbonotificarresponsavel: string;
    Fboalterar: string;
    Fbonovo: string;
    Fbonotificarsetorresponsavel: string;
    Fcdstrequisicaoproducao: Integer;
    Fnmstrequisicaoproducao: String;
    Fnucor: Integer;
  public
    [keyfield]
    property cdstrequisicaoproducao : Integer read Fcdstrequisicaoproducao write Fcdstrequisicaoproducao;
    property nmstrequisicaoproducao : String read Fnmstrequisicaoproducao write Fnmstrequisicaoproducao;
    property bonovo : string read Fbonovo write Fbonovo;
    property boexcluir : string read Fboexcluir write Fboexcluir;
    property boalterar : string read Fboalterar write Fboalterar;
    property bogerarinfo : string read Fbogerarinfo write Fbogerarinfo;
    property nucor : Integer read Fnucor write Fnucor;
    property bonotificarresponsavel : string read Fbonotificarresponsavel write Fbonotificarresponsavel;
    property bonotificarsolicitante : string read Fbonotificarsolicitante write Fbonotificarsolicitante;
    property bonotificarsetorresponsavel : string read Fbonotificarsetorresponsavel write Fbonotificarsetorresponsavel;
    property bonotificarsetorsolicitante : string read Fbonotificarsetorsolicitante write Fbonotificarsetorsolicitante;
  end;

implementation

end.
