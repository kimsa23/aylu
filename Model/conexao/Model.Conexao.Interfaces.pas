unit Model.Conexao.Interfaces;

interface

uses
  System.Classes;

type
  IModelConexao = Interface;
  IModelConexaoParametros = interface
  ['{8CDD0F48-6FB2-4EA3-AA58-7EA40234D0DB}']
    function Database(value : string):ImodelConexaoParametros;
    function UserName(value : string):ImodelConexaoParametros;
    function Password(value : string):ImodelConexaoParametros;
    function DriverId(value : string):ImodelConexaoParametros;
    function Server(value : string):ImodelConexaoParametros;
    function Porta(value : integer):ImodelConexaoParametros;
    function EndParametros : IModelConexao;
  end;
  IModelConexao = Interface
    ['{C46BDE4C-BA00-4AD6-9960-863A152E026B}']
    function EndConexao : TComponent;
    function Parametros : IModelConexaoParametros;
  End;

implementation

end.
