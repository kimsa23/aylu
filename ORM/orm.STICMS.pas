unit orm.STICMS;

interface

uses Classe.DAO;

type
  TSTICMS = class(TPersintentObject)
  private
    Fnmsticms: string;
    Fboicmssubtrib: string;
    Fboentrada: string;
    Fbocte: string;
    Fnusticms: string;
    Fboaliquota: string;
  public
    [keyfield]
    property nusticms : string read Fnusticms write Fnusticms;
    property nmsticms : string read Fnmsticms write Fnmsticms;
    property boentrada : string read Fboentrada write Fboentrada;
    property bocte : string read Fbocte write Fbocte;
    property boaliquota : string read Fboaliquota write Fboaliquota;
    property boicmssubtrib : string read Fboicmssubtrib write Fboicmssubtrib;
  end;

implementation

end.
