	IF OBJECT_ID('tempdb..#BaseLeaktable') IS NOT NULL 
                   BEGIN 
                     DROP TABLE #BaseLeaktable 
                        END
						IF OBJECT_ID('tempdb..#LinkLeaktable') IS NOT NULL 
                         BEGIN 
                          DROP TABLE #BaseLeaktable 
                           END
						   IF OBJECT_ID('tempdb..#BaseLinkLeaktable') IS NOT NULL 
                             BEGIN 
                              DROP TABLE #BaseLeaktable 
                              END