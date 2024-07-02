
module Aws
  class Bucket
    def initialize(bucket)
      @bucket = bucket
    end

    def get(key)
      AWS_S3_CLIENT.get_object(
        bucket: @bucket,
        key: key
      )
    end

    def list_objects
      AWS_S3_CLIENT.list_objects(
        bucket: @bucket
      )
    end
  end
end