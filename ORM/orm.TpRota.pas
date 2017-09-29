unit orm.TpRota;

interface

uses Classe.DAO;

type
  TTpRota = class(TRegistroQuipos)
  private
    Fbouf: string;
    Fboobservacao: string;
    Fbovalor: string;
    Fbobairro: string;
    Fbomunicipio: string;
    Fboitemcliente: string;
    Fcdtprota: integer;
    Fnmtprota: string;
  public
    [keyfield]
    property cdtprota : integer read Fcdtprota write fcdtprota;
    property nmtprota : string read Fnmtprota write fnmtprota;
    property boitemcliente : string read Fboitemcliente write fboitemcliente;
    property bobairro : string read Fbobairro write fbobairro;
    property bomunicipio : string read Fbomunicipio write fbomunicipio;
    property bouf : string read Fbouf write fbouf;
    property boobservacao : string read Fboobservacao write fboobservacao;
    property bovalor : string read Fbovalor write fbovalor;
  end;

implementation

end.
