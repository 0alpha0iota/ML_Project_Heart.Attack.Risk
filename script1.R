


split_bp <- do.call(rbind, strsplit(heart_attack$Blood.Pressure, split = "/"))


heart_attack$Systolic <- as.integer(split_bp[, 1])
heart_attack$Diastolic <- as.integer(split_bp[, 2])


heart_attack <- heart_attack[, -which(names(heart_attack) == "Blood.Pressure")]


bp_position <- which(names(heart_attack) == "Cholesterol") + 1
heart_attack <- heart_attack[, c(1:bp_position - 1, (ncol(heart_attack)-1):ncol(heart_attack), 
                                 bp_position:(ncol(heart_attack)-2))]
