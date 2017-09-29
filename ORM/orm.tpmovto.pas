unit orm.tpmovto;

interface

uses Classe.DAO;

type
  TTpMovto = class(TRegistroQuipos)
  private
    fcdtpmovto : Integer;
    fnmtpmovto : string;
    ftpmovto : string;
    fbovalor : string;
    fbovlvenda : string;
  public
    [keyfield]
    property cdtpmovto : Integer read fcdtpmovto write fcdtpmovto;
    property nmtpmovto : string read fnmtpmovto write fnmtpmovto;
    property tpmovto : string read ftpmovto write ftpmovto;
    property bovalor : string read fbovalor write fbovalor;
    property bovlvenda : string read fbovlvenda write fbovlvenda;
  end;

implementation

end.
