CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `school_management_sys`.`students w/ above average gpa` AS
    SELECT 
        `school_management_sys`.`students`.`uid` AS `uid`,
        CONCAT(`school_management_sys`.`general_directory`.`last_name`,
                ', ',
                `school_management_sys`.`general_directory`.`first_name`) AS `full_name`,
        `school_management_sys`.`students`.`cumulative_gpa` AS `cumulative_gpa`
    FROM
        (`school_management_sys`.`students`
        JOIN `school_management_sys`.`general_directory` ON ((`school_management_sys`.`students`.`uid` = `school_management_sys`.`general_directory`.`uid`)))
    WHERE
        (`school_management_sys`.`students`.`cumulative_gpa` > (SELECT 
                AVG(`school_management_sys`.`students`.`cumulative_gpa`)
            FROM
                `school_management_sys`.`students`))
    ORDER BY CONCAT(`school_management_sys`.`general_directory`.`last_name`,
            ', ',
            `school_management_sys`.`general_directory`.`first_name`)