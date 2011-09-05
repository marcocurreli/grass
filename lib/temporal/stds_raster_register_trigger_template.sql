--#############################################################################
-- This SQL script creates a trigger to update a space-time raster dataset
-- metadata
--
-- Author: Soeren Gebbert soerengebbert <at> googlemail <dot> com
--#############################################################################

-- SPACETIME_NAME is a placeholder for specific stds name (SQL compliant): name_mapset
-- SPACETIME_ID is a placeholder for specific stds id: name@mapset

PRAGMA foreign_keys = ON;

CREATE TRIGGER SPACETIME_NAME_raster_metadata_register_insert_trigger AFTER INSERT ON SPACETIME_NAME_raster_register 
  BEGIN
    -- Update the min and max values
    UPDATE strds_metadata SET min_min = 
           (SELECT min(min) FROM raster_metadata WHERE raster_metadata.id IN 
			(SELECT id FROM SPACETIME_NAME_raster_register)
           ) WHERE id = "SPACETIME_ID";
    UPDATE strds_metadata SET min_max = 
           (SELECT max(min) FROM raster_metadata WHERE raster_metadata.id IN 
			(SELECT id FROM SPACETIME_NAME_raster_register)
           ) WHERE id = "SPACETIME_ID";
    UPDATE strds_metadata SET max_min = 
           (SELECT min(max) FROM raster_metadata WHERE raster_metadata.id IN 
			(SELECT id FROM SPACETIME_NAME_raster_register)
           ) WHERE id = "SPACETIME_ID";
    UPDATE strds_metadata SET max_max = 
           (SELECT max(max) FROM raster_metadata WHERE raster_metadata.id IN 
			(SELECT id FROM SPACETIME_NAME_raster_register)
           ) WHERE id = "SPACETIME_ID";
    -- Update the resolution
    UPDATE strds_metadata SET nsres_min = 
           (SELECT min(nsres) FROM raster_metadata WHERE raster_metadata.id IN 
			(SELECT id FROM SPACETIME_NAME_raster_register)
           ) WHERE id = "SPACETIME_ID";
    UPDATE strds_metadata SET nsres_max = 
           (SELECT max(nsres) FROM raster_metadata WHERE raster_metadata.id IN 
			(SELECT id FROM SPACETIME_NAME_raster_register)
           ) WHERE id = "SPACETIME_ID";
    UPDATE strds_metadata SET ewres_min = 
           (SELECT min(ewres) FROM raster_metadata WHERE raster_metadata.id IN 
			(SELECT id FROM SPACETIME_NAME_raster_register)
           ) WHERE id = "SPACETIME_ID";
    UPDATE strds_metadata SET ewres_max = 
           (SELECT max(ewres) FROM raster_metadata WHERE raster_metadata.id IN 
			(SELECT id FROM SPACETIME_NAME_raster_register)
           ) WHERE id = "SPACETIME_ID";
  END;

CREATE TRIGGER SPACETIME_NAME_raster_metadata_register_delete_trigger AFTER DELETE ON SPACETIME_NAME_raster_register 
  BEGIN
    -- Update the min and max values
    UPDATE strds_metadata SET min_min = 
           (SELECT min(min) FROM raster_metadata WHERE raster_metadata.id IN 
			(SELECT id FROM SPACETIME_NAME_raster_register)
           ) WHERE id = "SPACETIME_ID";
    UPDATE strds_metadata SET min_max = 
           (SELECT max(min) FROM raster_metadata WHERE raster_metadata.id IN 
			(SELECT id FROM SPACETIME_NAME_raster_register)
           ) WHERE id = "SPACETIME_ID";
    UPDATE strds_metadata SET max_min = 
           (SELECT min(max) FROM raster_metadata WHERE raster_metadata.id IN 
			(SELECT id FROM SPACETIME_NAME_raster_register)
           ) WHERE id = "SPACETIME_ID";
    UPDATE strds_metadata SET max_max = 
           (SELECT max(max) FROM raster_metadata WHERE raster_metadata.id IN 
			(SELECT id FROM SPACETIME_NAME_raster_register)
           ) WHERE id = "SPACETIME_ID";
    -- Update the resolution
    UPDATE strds_metadata SET nsres_min = 
           (SELECT min(nsres) FROM raster_metadata WHERE raster_metadata.id IN 
			(SELECT id FROM SPACETIME_NAME_raster_register)
           ) WHERE id = "SPACETIME_ID";
    UPDATE strds_metadata SET nsres_max = 
           (SELECT max(nsres) FROM raster_metadata WHERE raster_metadata.id IN 
			(SELECT id FROM SPACETIME_NAME_raster_register)
           ) WHERE id = "SPACETIME_ID";
    UPDATE strds_metadata SET ewres_min = 
           (SELECT min(ewres) FROM raster_metadata WHERE raster_metadata.id IN 
			(SELECT id FROM SPACETIME_NAME_raster_register)
           ) WHERE id = "SPACETIME_ID";
    UPDATE strds_metadata SET ewres_max = 
           (SELECT max(ewres) FROM raster_metadata WHERE raster_metadata.id IN 
			(SELECT id FROM SPACETIME_NAME_raster_register)
           ) WHERE id = "SPACETIME_ID";
  END;

