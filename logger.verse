using { /Verse.org/Colors }

LogLevels:= enum {
    Info
    Warning
    Error
    Debug
}

logger<public> := class():
    log<private>(Msg:string, ?Level:LogLevels = LogLevels.Info, ?Duration:float := 2.0, ?Color:color := NamedColors.White)<transacts>:void=
        Print("{LevelToString(Level)} {Msg}",  ?Duration := Duration, ?Color := Color)
    
    info<public>(Msg:string)<transacts>:void=
        Self.log(Msg, ?Level := LogLevels.Info, ?Duration := 2.0, ?Color := LevelToColor(LogLevels.Info))

    warning<public>(Msg:string)<transacts>:void=
        Self.log(Msg, ?Level := LogLevels.Warning, ?Duration := 10.0, ?Color := LevelToColor(LogLevels.Warning))
    
    error<public>(Msg:string)<transacts>:void=
        Self.log(Msg, ?Level := LogLevels.Error, ?Duration := 20.0, ?Color := LevelToColor(LogLevels.Error))
       
    debug<public>(Msg:string)<transacts>:void=
        Self.log(Msg, ?Level := LogLevels.Debug, ?Duration := 2.0, ?Color := LevelToColor(LogLevels.Debug))
            
    LevelToString<private>(Level:LogLevels)<transacts>:string=
        case (Level):
            LogLevels.Info =>
                return "INFO: "
            LogLevels.Warning =>
                return "WARNING: "
            LogLevels.Error =>
                return "ERROR: "
            LogLevels.Debug =>
                return "DEBUG:"
        
    LevelToColor<private>(Level:LogLevels)<transacts>:color=
        case (Level):
            LogLevels.Debug =>
                return  NamedColors.LightBlue
            LogLevels.Info =>
                return NamedColors.White
            LogLevels.Warning =>
                return  NamedColors.Gold
            LogLevels.Error =>
                return  NamedColors.OrangeRed
            
