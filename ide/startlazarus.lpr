{  $Id: startlazarus.lpr 49909 2015-10-02 09:42:44Z juha $  }
{
 /***************************************************************************
                               startlazarus.lpr
                             --------------------
                   This is a wrapper to (re)start lazarus.

 ***************************************************************************/

 ***************************************************************************
 *                                                                         *
 *   This source is free software; you can redistribute it and/or modify   *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This code is distributed in the hope that it will be useful, but      *
 *   WITHOUT ANY WARRANTY; without even the implied warranty of            *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU     *
 *   General Public License for more details.                              *
 *                                                                         *
 *   A copy of the GNU General Public License is available on the World    *
 *   Wide Web at <http://www.gnu.org/copyleft/gpl.html>. You can also      *
 *   obtain it by writing to the Free Software Foundation,                 *
 *   Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.        *
 *                                                                         *
 ***************************************************************************
}
program StartLazarus;

{$mode objfpc}{$H+}

uses
  redirect_stderr,
  Interfaces, SysUtils,
  Forms,
  IDEInstances,
  LazarusManager;
  
{$R *.res}

var
  ALazarusManager: TLazarusManager;
  
begin
  redirect_stderr.DoShowWindow := False;
  Application.Initialize;
  LazIDEInstances.PerformCheck;
  if not LazIDEInstances.StartIDE then
    Exit;
  ALazarusManager := TLazarusManager.Create(nil);
  ALazarusManager.Initialize;
  ALazarusManager.Run;
  FreeAndNil(ALazarusManager);
end.

