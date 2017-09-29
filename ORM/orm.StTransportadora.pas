unit orm.StTransportadora;

interface

uses Classe.DAO;

type
  TStTransportadora = class(TRegistroQuipos)
  private
    Fbogerarinfo: string;
    Fboexcluir: string;
    Fbonovo: string;
    Fboalterar: string;
    Fbogerarsaida: string;
    Fbogerarentrada: string;
    Fnucor: Integer;
    Fcdsttransportadora: Integer;
    Fnmsttransportadora: string;
  public
    [keyfield]
    property cdsttransportadora : Integer read Fcdsttransportadora write Fcdsttransportadora;
    property nmsttransportadora : string read Fnmsttransportadora write Fnmsttransportadora;
    property nucor : Integer read Fnucor write Fnucor;
    property bonovo : string read Fbonovo write Fbonovo;
    property boalterar : string read Fboalterar write Fboalterar;
    property boexcluir : string read Fboexcluir write Fboexcluir;
    property bogerarinfo : string read Fbogerarinfo write Fbogerarinfo;
    property bogerarsaida : string read Fbogerarsaida write Fbogerarsaida;
    property bogerarentrada : string read Fbogerarentrada write Fbogerarentrada;
  end;

implementation

end.
