using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project.models
{
    public class Result<T>
    {
        public T Data { get; set; }
        public ErrorCode Error { get; set; }
        public string ErrorInfo { get; set; }

        public Result()
        {
            Error = ErrorCode.NaN;
            ErrorInfo = ""; 
        }
    }
}