unit orm.TpContrato;

interface

uses classe.dao;

type
  TTpContrato = class(TRegistroQuipos)
  private
    fboproduto : String;
    fbocliente : String;
    fbovlcontrato : String;
    fbodtiniciofinal : String;
    fboordserv : String;
    fbovlexcedente : String;
    fbocondpagto : String;
    fbopaciente : String;
    fbomensalidade : String;
    fbonegociacao : String;
    Fcdtpcontrato: Integer;
    Fnmtpcontrato: string;
  public
    [keyfield]
    property cdtpcontrato : Integer read Fcdtpcontrato write fcdtpcontrato;
    property nmtpcontrato : string read Fnmtpcontrato write fnmtpcontrato;
    property boproduto : String read Fboproduto write fboproduto;
    property bocliente : String read Fbocliente write fbocliente;
    property bovlcontrato : String read Fbovlcontrato write fbovlcontrato;
    property bodtiniciofinal : String read Fbodtiniciofinal write fbodtiniciofinal;
    property boordserv : String read Fboordserv write fboordserv;
    property bovlexcedente : String read Fbovlexcedente write fbovlexcedente;
    property bocondpagto : String read Fbocondpagto write fbocondpagto;
    property bopaciente : String read Fbopaciente write fbopaciente;
    property bomensalidade : String read Fbomensalidade write fbomensalidade;
    property bonegociacao : String read Fbonegociacao write fbonegociacao;
  end;

implementation

end.
